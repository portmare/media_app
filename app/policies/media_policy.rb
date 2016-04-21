# /app/policies/media_policy.rb
class MediaPolicy < ApplicationPolicy
  %w(new? create? destroy?).each do |method|
    define_method method do
      user.present? && record.album.present? && record.album.user == user
    end
  end
end
