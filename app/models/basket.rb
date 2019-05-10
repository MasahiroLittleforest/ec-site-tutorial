# == Schema Information
#
# Table name: baskets
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_baskets_on_user_id  (user_id)
#

class Basket < ApplicationRecord
  has_many :basket_products, dependent: :destroy
  has_many :products, through: :basket_products

  USD_RATE = 110.freeze

  def total_price(product_ids: nil)
    total_jpy_price(product_ids) + total_usd_price(product_ids)
  end

  private
  def total_jpy_price(product_ids)
    products = product_ids ? self.products.where(id: product_ids) : self.products
    jp_products = products.where(unit: 'yen')
    jp_products.sum(:price)
  end

  def total_usd_price(product_ids)
    products = product_ids ? self.products.where(id: product_ids) : self.products
    us_products = products.where(unit: 'usd')
    us_products.sum(:price) * USD_RATE
  end
end
