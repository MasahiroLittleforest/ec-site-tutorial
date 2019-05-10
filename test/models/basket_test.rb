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

require 'test_helper'

class BasketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
