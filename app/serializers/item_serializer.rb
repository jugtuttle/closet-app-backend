class ItemSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :name, :times_worn, :favorite
  has_one :user
  has_many :item_categories
  has_many :categories, through: :item_categories
end
