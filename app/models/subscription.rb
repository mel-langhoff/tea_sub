class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  validates :title, presence: true
  validates :price, presence: true
  validates :status, presence: true
  validates :frequency, presence: true
  # ensures that a customer can have only one subscription per tea.
  # each combo of t_id and c_id in the subs table is uniq
  validates :tea_id, uniqueness: { scope: :customer_id }
  enum status: ["cancelled", "active"]
end
