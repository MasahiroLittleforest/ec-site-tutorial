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

class Product < ApplicationRecord
    include Hashid::Rails

    mount_uploader :image, ImageUploader
    
    extend Enumerize
    enumerize :unit, in: [:yen, :usd]

    USD_RATE = 110.freeze

    belongs_to :admin

    has_many :basket_products, dependent: :destroy
    has_many :purchase_record_products, dependent: :destroy

    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true
    validates :unit, presence: true    
end
