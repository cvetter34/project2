class MenuItemsController < ApplicationController
  before_action :get_menu
  before_action :get_menu_item, except: [ :index, :new, :create ]

  def index
    @menu_items = @menu.menu_items
  end

  def show
  end

  def new
    @menu_item = @menu.menu_items.build
  end

  def create
    @menu_item = @menu.menu_items.new( menu_item_params )

    if @menu_item.save
      redirect_to menu_menu_item_url(@menu, @menu_item), notice: "#{@menu_item.name} created."
    else
      render :new, alert: "#{@menu_item.name} won't save."
    end
  end

  def edit
  end

  def update
    if @menu_item.update_attributes( menu_item_params )
      redirect_to menu_menu_item_url(@menu, @menu_item), notice: "#{@menu_item.name} updated."
    else
      render :new, alert: "#{@menu_item.name} won't save."
    end
  end

  def destroy
    if @menu_item.destroy
      redirect_to menu_menu_items_url(@menu), notice: "Destroyed menu item: #{@menu_item.name}."
    else
      redirect_to menu_menu_items_url(@menu), alert: "Failed to destroy menu item: #{@menu_item.name}."
    end
  end

  private

  def get_menu
    unless @menu = Menu.find( params[:menu_id] )
      redirect_to menus_url, alert: "Can't find menu with ID #{params[:menu_id]}."
    end
  end

  def get_menu_item
    unless @menu_item = @menu.menu_items.find( params[:id] )
      redirect_to menu_menu_items_url(@menu), alert: "Can't find menu item with ID #{params[:id]}."
    end
  end

  def menu_item_params
    params.require(:menu_item).permit( :name, :price, :description )
  end
end
