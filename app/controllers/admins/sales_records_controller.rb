class Admins::SalesRecordsController < Admins::ApplicationController
  def show
    @purchase_record_products = current_admin.purchase_record_products.preload(:product)
    if params[:start_at] && params[:end_at]
      start_at, end_at = get_dates_in_parsing_params
      @purchase_record_products = @purchase_record_products.where(created_at: start_at..end_at)
    end
  end

  private
  def get_dates_in_parsing_params
    start_at = Date.parse(params[:start_at])
    end_at = Date.parse(params[:end_at])

    return start_at, end_at
  end
end