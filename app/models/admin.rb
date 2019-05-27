# == Schema Information
#
# Table name: admins
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_admins_on_email                 (email) UNIQUE
#  index_admins_on_reset_password_token  (reset_password_token) UNIQUE
#

class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  
  has_many :products, dependent: :destroy
  has_many :purchase_record_products, through: :products
  

  def sales
    sold_products = self.products.joins(:purchase_record_products)
    PriceCalculator.total(sold_products)
  end

  def sales_this_month
    sold_products = self.products
                          .joins(:purchase_record_products)
                          .where(purchase_record_products: { created_at: Time.current.all_month })
    PriceCalculator.total(sold_products)
  end
end
