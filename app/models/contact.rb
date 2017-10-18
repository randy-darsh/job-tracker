class Contact < ApplicationRecord
  validates :full_name, presence: true
  validates :position, presence: true
  validates :email, presence: true
  belongs_to :company
end
