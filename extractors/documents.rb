# frozen_string_literal: true

module DocumentsExtractorHelper
  def has_tc?
    json['tc'] == true
  end

  def has_cons?
    json['cons'] == true
  end
end
