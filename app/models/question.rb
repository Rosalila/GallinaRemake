class Question < ActiveRecord::Base
  belongs_to :metric
  has_many :reviews
  belongs_to :question_type
end
