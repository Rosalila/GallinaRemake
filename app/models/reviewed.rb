class Reviewed < ActiveRecord::Base
  belongs_to :gallina
  has_many :reviews
end
