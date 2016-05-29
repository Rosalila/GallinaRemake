class User < ActiveRecord::Base
  has_many :corral_members
  has_many :corrals, through: :corral_members
end
