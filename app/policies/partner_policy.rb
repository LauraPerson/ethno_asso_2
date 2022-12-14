class PartnerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.super_admin?
  end

  def index?
    true
  end

  def edit?
    true 
  end 

  def update?
    edit?
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
