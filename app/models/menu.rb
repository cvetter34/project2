class Menu

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :price, type: String
  field :description, type: String
  field :new, type: Boolean

  # field :menu
  # field :homepage
  # field :contact_info
end