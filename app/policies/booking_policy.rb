class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user || record.pool.user == user
  end

  def cancel?
    record.user == user || record.pool.user == user
  end
end
