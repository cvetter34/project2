class MenusController < ApplicationController
  before_action :is_admin?
  before_action :get_menu, except: [ :index, :new, :create ]

  def index
    @menus = Menu.all.entries
  end

  def show
  end

  def new
    @menu = Menu.new
    @menu.menu_items.build
  end

  def create
    if @menu.save
      redirect_to menu_url(@menu), notice: "#{@menu.name} created."
    else
      render :new, alert: "#{@menu.name} won't save."
    end
  end

  def edit
    @menu.menu_items.build
    @menu = Menu.find( params[:id] )
  end

  def update
    if @menu.update_attributes( menu_params )
      redirect_to menu_url(@menu), notice: "#{@menu.name} updated."
    else
      render :new, alert: "#{@menu.name} won't save."
    end
  end

  def destroy
    if @menu.destroy
      redirect_to menus_url, notice: "Destroyed menu: #{@menu.name}."
    else
      redirect_to menus_url, alert: "Failed to destroy menu: #{@menu.name}."
    end
  end

  private

  def get_menu
    unless @menu = Menu.find( params[:id] )
      redirect_to menus_url, alert: "Can't find menu with ID = #{params[:id]}."
    end
  end

  def menu_params
    params.require(:menu).permit(
      :name,
      :title,
      :menu_item_attributes => [
        :name, :price, :description
      ]
    )
  end
end