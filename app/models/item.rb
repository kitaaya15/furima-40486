class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :day

  with_options presence: true do
    validates :item_name, :description, :image
  end
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    presence: { message: "can't be blank" }

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id, :condition_id, :fee_id, :prefecture_id, :day_id
  end
end
