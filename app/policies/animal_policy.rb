class AnimalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def search?
    true
  end

  def create?
    true
  end

  def show?
    true #  Anyone can access
  end

  def update?
    belongs_to_user_or_is_admin?
  end

  def destroy?
    belongs_to_user_or_is_admin?
  end

  private

  def belongs_to_user_or_is_admin?
    record.user == user #|| user.admin
  end
end
