# frozen_string_literal: true

module MiscComposerHelper
  def misc_values
    {
      has_tc: has_tc?,
      has_cons: has_cons?,
      has_forms_without_pp: has_forms_without_pp?
    }
  end
end
