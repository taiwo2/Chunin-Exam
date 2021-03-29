class WebLinkPolicy < ApplicationPolicy
  def show?
    current_user?
  end

  def update?
    current_user?
  end

  def destroy?
    current_user?
  end

  private

  def current_user?
    user == record.user
  end
end
