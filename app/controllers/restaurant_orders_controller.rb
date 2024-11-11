class RestaurantOrdersController < ApplicationController
  include ActionController::MimeResponds
  include Pagy::Backend

  def show
    @restaurant_order = RestaurantOrder.find_by(id: params[:id], restaurant_id: params[:restaurant_id])
    Rails.logger.info("Restaurant order: #{@restaurant_order.inspect}")

    respond_to do |format|
      format.html
      format.pdf do
        pdf_html = ActionController::Base.new.render_to_string(
          template: 'orders/restaurant_order',
          layout: 'restaurantpdf',
          locals: { restaurant_order: @restaurant_order, pagy: @pagy, order_items: @order_items },
          page_size: 'A4',
          disable_smart_shrinking: true,
          enable_local_file_access: true
        )

        pdf = WickedPdf.new.pdf_from_string(pdf_html)
        send_data pdf, filename: "RestaurantOrder_#{@restaurant_order.id}.pdf", type: 'application/pdf', disposition: 'inline'
      end
    end
  end
end
