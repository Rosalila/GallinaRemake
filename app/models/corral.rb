class Corral < ActiveRecord::Base
  has_many :corral_members
  has_many :corral_invites
  has_many :metrics
  has_many :gallinas
  has_many :users, through: :corral_members
  has_many :questions, through: :metrics
end
