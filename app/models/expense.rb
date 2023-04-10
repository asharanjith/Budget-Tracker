class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :group
  has_many :group_expenses, dependent: :destroy
  has_many :groups, through: :group_expenses

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0, message: 'Amount must be greater than 0' }
  validates :group, presence: true, length: { minimum: 1, message: 'Expense must belong to at least one group' }
end
