# frozen_string_literal: true

require 'yaml'

# Check if input file is provided
if ARGV[0].nil?
  puts 'Please provide an input TSV file.'
  exit
end

input_file = ARGV[0]
output_file = ARGV[1]

# Read the TSV file
tsv_data = File.read(input_file).split("\n")
headers = tsv_data[0].split("\t")

# Convert TSV to YAML
yaml_data = tsv_data[1..].map do |line|
  values = line.split("\t")
  headers.zip(values).to_h
end

# Output to file or screen
if output_file
  File.write(output_file, yaml_data.to_yaml)
else
  puts yaml_data.to_yaml
end
