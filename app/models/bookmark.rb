class Bookmark < ApplicationRecord
  validates :user_id, uniqueness: { scope: :entry_id }
  belongs_to :user
  belongs_to :entry
end
