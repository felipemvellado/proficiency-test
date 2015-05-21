class Course < ActiveRecord::Base
  has_many :classrooms
  has_many :students, through: :classrooms

  validates_uniqueness_of :name
  validates :name, :description, :status, presence: true
  validates :name, :description, length: { maximum: 45 }

  enum status: %i(open closed)
end
