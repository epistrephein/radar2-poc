# frozen_string_literal: true

class RulesExtractor
  include CmsExtractorHelper
  include DocumentsExtractorHelper
  include FormsExtractorHelper

  attr_reader :json

  def initialize(json)
    @json = JSON.parse(File.read(json))
  end

  def parse
    {
      has_tc: has_tc?,
      has_cons: has_cons?,
      has_forms_without_pp: has_forms_without_pp?,
      forms_without_pp: forms_without_pp,
      has_shopify: has_shopify?,
      has_woo_commerce: has_woo_commerce?,
      has_ecommerce: has_ecommerce?
    }
  end
end
