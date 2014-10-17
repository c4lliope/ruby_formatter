require "ruby_formatter"

def test_cases
  Dir.entries("spec/features/test_cases/") - ['.', '..']
end

def input_file_for(test_case)
  "spec/features/test_cases/#{test_case}/input.rb"
end

def expected_file_for(test_case)
  "spec/features/test_cases/#{test_case}/expected.rb"
end

test_cases.each do |test_case|
  RSpec.describe(test_case) do
    it "matches the expected output" do
      input = File.read(input_file_for(test_case))
      expected = File.read(expected_file_for(test_case))

      expect(RubyFormatter.process(input)).to eq expected
    end
  end
end
