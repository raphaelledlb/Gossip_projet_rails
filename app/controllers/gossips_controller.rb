class GossipsController < ApplicationController
  def new
  end

  def index 
    @gossips = Gossip.all
  end 

  def show
    @goss_id = Gossip.find(params['id'])
  end

  def edit 
    @goss_id = Gossip.find(params['id'])
  end 

  def update
    @goss_id = Gossip.find(params['id'])
    post_params = params.require(:gossip).permit(:title, :content)
    if @goss_id.update(post_params)
      redirect_to @goss_id
    else
      render :edit
    end
  end

  def create
    @gossip = Gossip.new(title: params["gossip_title"], content: params["gossip_content"], user: User.find(1))

    if @gossip.save
      redirect_to static_pages_home_path
    else
      redirect_to new_gossip_path
    end
  end


end
