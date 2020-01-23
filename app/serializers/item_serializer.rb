class ItemSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :name, :times_worn, :favorite, :outfits
  has_one :user
end
