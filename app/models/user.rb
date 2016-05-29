class User < ActiveRecord::Base
  has_many :corral_members
  has_many :corral_invites
  has_many :corrals, through: :corral_members

  def belongs_to_corral corral_id
    corrals.each do |corral|
      if corral.id == corral_id
        return true
      end
    end
    return false
  end
end
