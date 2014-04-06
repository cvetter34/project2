class Menu
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :menu_items
  accepts_nested_attributes_for :menu_items

  field :name
  field :title
end
