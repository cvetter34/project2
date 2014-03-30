class AdminController < ApplicationController
 before_action :is_admin?
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
    params.require(:content_management).permit(:name, :price, :description, :new)
  end

end