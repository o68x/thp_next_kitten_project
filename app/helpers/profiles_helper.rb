# frozen_string_literal: true

module ProfilesHelper
  def bg_available(cat)
    "bg-light" unless cat.is_available
  end
end
