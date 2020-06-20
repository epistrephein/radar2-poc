# frozen_string_literal: true

module FormsExtractorHelper
  def has_forms_without_pp?
    !json['forms_without_pp'].empty?
  end

  def forms_without_pp
    json['forms_without_pp']
  end
end
