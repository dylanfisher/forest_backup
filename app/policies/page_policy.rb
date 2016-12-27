class PagePolicy < ApplicationPolicy
  def show?
    scope.where(:id => record.id).exists? &&
    ( record.published? || edit? )
  end
end
