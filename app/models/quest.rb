class Quest < ApplicationRecord
  validates :title, presence: true
  validates :status, inclusion: { in: [ true, false ] }
end
