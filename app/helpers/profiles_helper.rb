# frozen_string_literal: true

module ProfilesHelper
  # change card background for unavailable cats
  def bg_available(cat)
    "bg-light" unless cat.is_available
  end
end
