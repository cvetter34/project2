class ContentManagement

  include Mongoid::Document
  include Mongoid::Timestamps

  field :menuItem1, type: String
  field :menuItem2, type: String
  field :menuItem3, type: String
  field :menuItem4, type: String
  field :menuItem5, type: String

  # field :menu
  # field :homepage
  # field :contact_info
end