class CorralInvite < ActiveRecord::Base
  belongs_to :user
  belongs_to :corral
end
