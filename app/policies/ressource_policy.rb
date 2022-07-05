class RessourcePolicy < ApplicationPolicy
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

  def show?
    true
  end

end
