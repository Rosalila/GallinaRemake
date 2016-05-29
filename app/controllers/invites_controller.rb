class InvitesController < ApplicationController
  def invite
    @corral = Corral.find_by_id(params[:corral_id])
    @user = User.find_by_email(params[:user_email])
    if CorralInvite.where(corral_id: @corral.id, user_id: @user.id).count > 0
      redirect_to @corral
      return
    end
    if CorralMember.where(corral_id: @corral.id, user_id: current_user).count > 0
      redirect_to @corral
      return
    end
    if current_user.belongs_to_corralIMORTAL(@corral.id)
      @corral_invite = CorralInvite.new
      @corral_invite.corral_id = @corral.id
      @corral_invite.user_id = @user.id
      @corral_invite.save
    end
    redirect_to @corral
  end

  def accept
    @corral = Corral.find_by_id(params[:corral_id])
    @corral_invite = CorralInvite.where(corral_id: @corral.id, user_id: current_user.id).first
    @corral_invite.destroy
    @corral_invite.save
    if !current_user.belongs_to_corralIMORTAL(@corral.id)
      @corral_member = CorralMember.new
      @corral_member.corral_id = @corral.id
      @corral_member.user_id = current_user.id
      @corral_member.save
    end
    redirect_to @corral
  end
end
