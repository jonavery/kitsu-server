class InstallmentPolicy < ApplicationPolicy
  # TODO: delegate this to the policy of the media
  def show?
    # Yes, if you can see NSFW content
    return true if see_nsfw?
    # Otherwise, return whether the media is sfw
    record.media.sfw?
  end

  # TODO: wiki features
  alias_method :update?, :is_admin?
  alias_method :create?, :is_admin?
  alias_method :destroy?, :is_admin?
end
