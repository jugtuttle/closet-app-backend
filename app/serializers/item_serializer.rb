class ItemSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :name, :times_worn, :favorite
  has_one :user
end
