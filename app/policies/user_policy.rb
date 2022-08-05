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
    user == user
  end

  def update?
    user == user
  end

  def create?
    user.super_admin?
  end
end
