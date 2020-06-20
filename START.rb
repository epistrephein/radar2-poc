# frozen_string_literal: true

# This is an example, Ruby-only workflow that serves as a Proof of Concept
# The `json` folder contains examples of input data that this workflow will receive
# The `rules` folder containes versioned rules YAML files with the concorded syntax
#
# The RulesExtractor receives an input JSON and converts its value to a series
# of standardized params, mostly true or false, as an hash
#
# The RulesProcessor receives this hash in input and matches it agains the rules
# yaml file, outputting all rules that are true

require 'json'
require 'yaml'

require_relative 'extractors/cms'
require_relative 'extractors/documents'
require_relative 'extractors/forms'
require_relative 'rules_extractor'
require_relative 'rules_processor'

%w[json/radar1.json json/radar2.json json/radar3.json].each do |filename|
  data         = RulesExtractor.new(filename).parse
  passed_rules = RulesProcessor.new(1, data).call

  puts filename
  puts passed_rules.join("\n")
  puts
end
