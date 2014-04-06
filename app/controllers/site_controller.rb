class SiteController < ApplicationController

  before_action :is_authenticated?

  def index
    @splash = User.all.entries.sample
    @users = User.all.entries
  end

  def privacy
  end

  def terms
  end

  # def menu
  #   @items = Menu.all.entries
  #   @message = "OMG HAY"
  # end

  def photos
  end

  def location
  end

  def contact
  end

end