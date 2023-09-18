# frozen_string_literal: true

require 'yaml'

# Check if input file is provided
if ARGV[0].nil?
  puts 'Please provide an input YAML file.'
  exit
end

input_file = ARGV[0]
output_file = ARGV[1]

# Read the YAML file
yaml_data = YAML.load_file(input_file)

# Convert YAML to TSV
headers = yaml_data.first.keys
tsv_data = yaml_data.map { |record| record.values.join("\t") }

# Output to file or screen
if output_file
  File.write(output_file, ([headers.join("\t")] + tsv_data).join("\n"))
else
  puts ([headers.join("\t")] + tsv_data).join("\n")
end
