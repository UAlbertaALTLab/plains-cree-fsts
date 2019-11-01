#!/usr/bin/env ruby

require 'pathname'

HERE = Pathname.new(__dir__).realdirpath
FST_DIR = HERE.parent / 'src'
raise "Bad src directory" unless FST_DIR.directory?

EX_FAILURE = 0x41
EX_USAGE = 0x42

IMPLEMENTATIONS = {
  hfst: {bin: 'hfst-lookup -q', ext: 'hfst' },
  hfstol: {bin: 'hfst-optimized-lookup -q', ext: 'hfstol' },
  foma: {bin: 'flookup -q', ext: 'fomabin' },
}


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

class TestContext
  def initialize(transducer)
    @transducer = transducer
  end

  def transduce(input, specification)
    IMPLEMENTATIONS.each_pair do |name, config|
      bin = config[:bin]
      ext = config[:ext]
      transducer_path = FST_DIR / "#{@transducer}.#{ext}"
      expected = specification[:contains]
      raise "Invalid specification" if expected.nil?

      # 
      results = _run(bin, transducer_path, input)

      relevant_tranductions = results
        .select { |(i, _)| i == input }
        .map {|(_, transduction)| transduction}

      unless relevant_tranductions.include?(expected)
        $stderr.puts("[#{name}] could not find transduction of #{input} to #{expected} in #{relevant_tranductions}")
        exit(EX_FAILURE)
      end
    end
  end

  private
  def _run(suite, transducer, input)
    raw_output = %x{echo "#{input}" | #{suite} #{transducer}}
    format_transductions(raw_output)
  end
end


class FST
  def self.test(transducer, &block)
    t = TestContext.new(transducer)
    t.instance_exec(&block)
    puts("All FST tests passed! 🥳")
  end
end
