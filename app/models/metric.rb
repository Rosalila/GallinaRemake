class Metric < ActiveRecord::Base
  belongs_to :corral
  belongs_to :metric_type
end
