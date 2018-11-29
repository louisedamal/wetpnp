class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: current_user)
    end
  end

  def show?
    true
  end

  def new?
    create?
  end

  def update?
    true
  end

  def edit?
    update?
  end
end
