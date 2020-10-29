class StaticPagesController < ApplicationController
  def home
  end

  def team
  end

  def contact
  end

  def welcome
  end

  def show
    @goss_id = Gossip.find(params['id'])
  end

  def user_details
    @user = User.find(params['id'])
  end


end
