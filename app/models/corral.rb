class Corral < ActiveRecord::Base
  has_many :corral_members
  has_many :corral_invites
  has_many :users, through: :corral_members
end
