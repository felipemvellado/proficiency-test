class Course < ActiveRecord::Base
  validates_uniqueness_of :name
  validates :name, :description, :status, presence: true
  validates :name, :description, length: { maximum: 45 }

  enum status: %i(open closed)
end
