class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.count_by_interest
    order(:level_of_interest).group(:level_of_interest).count
  end

  def self.count_by_city
    order(:city).group(:city).count
  end
end
