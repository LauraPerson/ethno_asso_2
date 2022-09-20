class PartnerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.admin?
  end

  def index?
    true
  end

  # def edit?
  #   user.super_admin? || user == record.user
  # end

  # def update?
  #   user.super_admin? || user == record.user
  # end

  def destroy?
    user.super_admin?
  end
end
