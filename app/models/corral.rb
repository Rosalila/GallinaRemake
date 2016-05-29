class Corral < ActiveRecord::Base
  has_many :corral_members
  has_many :users, through: :corral_members
end
