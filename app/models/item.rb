class Item < ApplicationRecord
  belongs_to :user
  has_many :item_categories
  has_many :categories, through: :item_categories
  has_many  :outfit_items
  has_many :outfits, through: :outfit_items

end
