# frozen_string_literal: true

class RulesProcessor
  attr_reader :rules, :data

  RULES_FILE = 'rules/rules-v%<version>d.yml'

  def initialize(rules_version, data)
    rules_file = format(RULES_FILE, version: rules_version)

    @rules = YAML.safe_load(File.read(rules_file))
    @data  = data
  end

  def call
    rules['rules'].select do |_rule, conditions|
      or_true(conditions) && and_true(conditions)
    end.keys
  end

  private

  # verify that at least one OR condition is true (or absent)
  def or_true(conditions)
    return true if conditions['or'].nil?

    conditions['or'].any? { |param, value| data[param.to_sym] == value }
  end

  # verify that all AND conditions are true (or absent)
  def and_true(conditions)
    return true if conditions['and'].nil?

    conditions['and'].all? { |param, value| data[param.to_sym] == value }
  end
end
