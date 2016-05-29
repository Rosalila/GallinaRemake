class Gallina < ActiveRecord::Base
  belongs_to :corral
  has_many :revieweds
end
