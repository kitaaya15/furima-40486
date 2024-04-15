class OderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture, :city, :block, :building, :phone_number
end