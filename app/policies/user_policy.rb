class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.super_admin?
  end

  def show?
    true
  end

  def edit?
    true
  end

  def update?
    true
  end

  def create?
    user.super_admin?
  end

  def destroy?
    user.super_admin?
  end
end
