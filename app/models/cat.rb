class Cat < ApplicationRecord
  validates :name, :age, :enjoys, :profile_pic, presence: true
  validates :enjoys, length: { minimum:10 }
end
