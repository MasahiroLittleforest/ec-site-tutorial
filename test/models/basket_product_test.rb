# == Schema Information
#
# Table name: basket_products
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  basket_id  :integer          not null
#  product_id :integer          not null
#
# Indexes
#
#  index_basket_products_on_basket_id   (basket_id)
#  index_basket_products_on_product_id  (product_id)
#

require 'test_helper'

class BasketProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
