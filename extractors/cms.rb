# frozen_string_literal: true

module CmsExtractorHelper
  def has_ecommerce?
    has_shopify? || has_woo_commerce?
  end

  def has_shopify?
    json['cms'] == 'Shopify'
  end

  def has_woo_commerce?
    json['cms'] == 'WooCommerce'
  end
end
