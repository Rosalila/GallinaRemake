class Question < ActiveRecord::Base
  belongs_to :metric
  belongs_to :question_type
end
