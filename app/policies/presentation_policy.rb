class PresentationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end


  def edit?
    user.super_admin? 
  end 

  def update?
    edit?
  end
end
