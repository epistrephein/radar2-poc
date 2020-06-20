# frozen_string_literal: true

module EcommerceComposerHelper
  def ecommerce_values
    {
      has_shopify: has_shopify?,
      has_woo_commerce: has_woo_commerce?,
      has_ecommerce: has_ecommerce?
    }
  end
end
