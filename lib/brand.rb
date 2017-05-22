class Brand < ActiveRecord::Base
  has_many :shoes
  has_many :stores, through: :shoes

  validates_uniqueness_of :name, :case_sensitive => false
  validates :name, {:presence => true, :length => {:maximum => 100}}
  before_create(:capitalizeit)
end


def capitalizeit
  self.name.capitalize!
end
