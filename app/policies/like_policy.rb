class LikePolicy < ApplicationPolicy
  def create?
    user.present?
  end
end

