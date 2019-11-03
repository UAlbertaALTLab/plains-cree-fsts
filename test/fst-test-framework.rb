#!/usr/bin/env ruby

require 'pathname'

HERE = Pathname.new(__dir__).realdirpath
FST_DIR = HERE.parent / 'src'
raise 'Bad src directory' unless FST_DIR.directory?

EX_FAILURE = 0x41
EX_USAGE = 0x42

# An FST lookup implementation.
# It knows its name, its executable path,
# and the file extension for this kind of FST.
class LookupImplementation
  @implementations = {}

  class << self
    def inherited(child_class)
      @implementations[child_class.id] = child_class.new
    end

    def each(&block)
      @implementations.each_value(&block)
    end

    def bin(value = nil)
      value.nil? ? @bin : @bin = value
    end

    def ext(value = nil)
      value.nil? ? @ext : @ext = value
    end

    def id(value = nil)
      return @name = value unless value.nil?
      return @name unless @name.nil?

      name.downcase.to_sym
    end
  end

  def id
    self.class.id
  end

  def bin
    self.class.bin
  end

  def ext
    self.class.ext
  end

  def execute(transducer, raw_input)
    `echo "#{raw_input}" | #{bin} #{transducer}`
  end
end

# flookup
class Foma < LookupImplementation
  bin 'flookup -q'
  ext 'fomabin'
end

# hfst-lookup
class Hfst < LookupImplementation
  bin 'hfst-lookup -q'
  ext 'hfst'
end

# hfst-optimized-lookup
class HfstOl < LookupImplementation
  bin 'hfst-optimized-lookup -q'
  ext 'hfstol'
end

def format_transductions(raw_transductions)
  lines = raw_transductions.split("\n")
  results = lines.map do |line|
    fields = line.split("\t")
    input = fields[0]
    return nil if input.nil?

    transduction = fields[1]
    [input, transduction]
  end

  results.reject(&:nil?)
end

# The context in which the DSL is run
class TestContext
  def initialize(transducer)
    @transducer = transducer
  end

  def transduce(input, specification)
    LookupImplementation.each do |fst_impl|
      transducer_path = FST_DIR / "#{@transducer}.#{fst_impl.ext}"
      expected = specification[:contains]
      raise 'Invalid specification' if expected.nil?

      _run_and_filter(fst_impl, transducer_path, input, expected)
    end
  end

  private

  def _run_and_filter(impl, transducer_path, input, expected)
    results = _run(impl, transducer_path, input)

    relevant_tranductions =
      results.select { |(i, _)| i == input }
             .map { |(_, transduction)| transduction }

    return if relevant_tranductions.include?(expected)

    warn("[#{impl.name}] could not find transduction of #{input} " \
         "to #{expected} in #{relevant_tranductions}")
    exit(EX_FAILURE)
  end

  def _run(impl, transducer, input)
    raw_output = impl.execute(transducer, input)
    format_transductions(raw_output)
  end
end

# Class for invoking the DSL
class FST
  def self.test(transducer, &block)
    t = TestContext.new(transducer)
    t.instance_exec(&block)
    puts('All FST tests passed! 🥳')
  end
end
