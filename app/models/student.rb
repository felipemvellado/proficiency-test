class Student < ActiveRecord::Base
  validates_uniqueness_of :register_number
  validates :name, :register_number, :status, presence: true
  validates :name, :register_number, length: { maximum: 45 }

  enum status: %i(unregistered registered)
end
