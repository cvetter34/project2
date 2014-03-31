class AdminController < ApplicationController
 before_action :is_admin?
  def menuedit
    @items = ContentManagement.all.entries
  end

  def update
    menu_params.each do |key, value|
      @item = ContentManagement.find_by id: key
      @item.update_attributes value if @item
    end
    redirect_to menu_url
  end

  private

  def menu_params
    params.require(:items).permit! #(:name, :price, :description, :new)
  end

end