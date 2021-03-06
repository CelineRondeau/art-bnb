class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user || record.painting.user == user
  end

  def incoming?
    true
  end

  def outgoing?
    true
  end

  def show?
    record.user == user
  end
end
