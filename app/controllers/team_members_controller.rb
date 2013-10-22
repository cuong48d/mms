class TeamMembersController < ApplicationController
  before_action :signed_in_user

  def create
          @team = Team.find(params[:team_member][:team_id])
          @team.join!(current_user)
          redirect_to @team
   # @user = User.find(params[:relationship][:followed_id])
    #current_user.follow!(@user)
    #redirect_to @user
   # render 'index'
  end

  def destroy
          @team_member = TeamMember.find(params[:id])
          @team = Team.find(@team_member.team_id)
          @team_member.destroy
          redirect_to @team
  # current_user.unfollow!(@user)
  # redirect_to @user
         # render 'index'
  end
end