class Entry < ApplicationRecord
  belongs_to :feed
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end
end
