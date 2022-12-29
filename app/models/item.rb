class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition

  belongs_to :user
  has_one_attached :image
  has_one :order

  validates :product_name,       presence: true
  validates :explanation,        presence: true
  validates :condition_id,       presence: true
  validates :delivery_charge_id, presence: true
  validates :shipping_day_id,    presence: true
  validates :price,              presence: true
  validates :prefecture_id,      presence: true
  validates :category_id ,       presence: true
  validates :image,              presence: true

  with_options numericality: { other_than: 0, message: 'select' } do
    validates :category_id
    validates :shipping_day_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :condition_id
  end

  validates :price, format: { with: /\A[0-9]+\z/, message: 'Price Half-width number' }, inclusion: { in: (300..9_999_999), message: 'Out of setting range' }


end
