# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  description :text             not null
#  image       :string
#  name        :string           not null
#  price       :integer          not null
#  unit        :string           default("yen"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  admin_id    :integer          not null
#
# Indexes
#
#  index_products_on_admin_id  (admin_id)
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
