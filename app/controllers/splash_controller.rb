class SplashController < ApplicationController

  def home
    @message = "HAY SUP"
    @splash = User.all.entries.sample
  end

  def menu
    @message = "OMG HAY"
  end

  def photos
  end

  def location
  end

  def contact
  end

end