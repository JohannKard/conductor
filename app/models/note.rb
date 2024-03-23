class Note < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  validates :date, presence: true
end
