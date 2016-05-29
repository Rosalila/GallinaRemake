class CorralMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :corral
end
