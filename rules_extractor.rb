# frozen_string_literal: true

class RulesExtractor
  include CmsExtractorHelper
  include DocumentsExtractorHelper
  include FormsExtractorHelper

  include EcommerceComposerHelper
  include MiscComposerHelper

  attr_reader :json

  def initialize(json)
    @json = JSON.parse(File.read(json))
  end

  def parse
    composers = [
      ecommerce_values,
      misc_values
    ]

    composers.reduce(&:merge)
  end
end
