class AdminController < ApplicationController

  def menuedit
    @items = ContentManagement.all.entries.first
  end

  def update
    @items = ContentManagement.all.entries.first
    @items.update_attributes( menu_params )
    redirect_to menu_url
  end

  private

  def menu_params
    params.require(:content_management).permit(:menuItem1, :menuItem2, :menuItem3, :menuItem4, :menuItem5)
  end

end