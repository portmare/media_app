# app/policies/album_policy.rb
class AlbumPolicy < ApplicationPolicy
  %w(index? new? create?).each do |method|
    define_method method do
      user.present?
    end
  end

  %w(edit? update? destroy?).each do |method|
    define_method method do
      user == record.user
    end
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end