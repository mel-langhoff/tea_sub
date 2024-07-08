class Tea < ApplicationRecord
  # cascading deletion: associated records (\subs) are auto deleted when their parent (tea) is deleted
  has_many :subscriptions, dependent: :destroy
  has_many :customers, through: :subscriptions

  validates :title, presence: true
  validates :description, presence: true
  validates :temp, presence: true
  validates :brew_time, presence: true
end
