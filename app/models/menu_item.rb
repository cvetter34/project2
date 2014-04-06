class MenuItem
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :menu

  field :name
  field :price, type: Integer
  field :description

  validates :name, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
end
