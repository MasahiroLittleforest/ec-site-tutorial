# == Schema Information
#
# Table name: purchase_records
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_purchase_records_on_user_id  (user_id)
#

require 'test_helper'

class PurchaseRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
