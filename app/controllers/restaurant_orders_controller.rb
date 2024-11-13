class RestaurantOrdersController < ApplicationController
  include ActionController::MimeResponds

  def show
    @restaurant_order = RestaurantOrder.find_by(id: params[:id], restaurant_id: params[:restaurant_id])
    Rails.logger.info("Restaurant order: #{@restaurant_order.inspect}")

    respond_to do |format|
      format.html
        format.pdf do
          pdf_html = ActionController::Base.new.render_to_string(
            template: 'orders/restaurant_order',
            layout: 'restaurantpdf',
            locals: { restaurant_order: @restaurant_order, order_items: @order_items },
            page_size: 'A4',
            disable_smart_shrinking: true,
            enable_local_file_access: true
          ) 

        header_html = ActionController::Base.new.render_to_string(
          template: 'orders/restaurant_pdf_header',
          layout: 'restaurantpdfheader' ,
          locals: { restaurant_order: @restaurant_order },
          disable_smart_shrinking: true,
          enable_local_file_access: true
        )

        # Rails.logger.info("Restaurant header: #{header_html.inspect}")

          pdf = WickedPdf.new.pdf_from_string(
              pdf_html,
              header: {
                content: header_html  
              },              
              footer: {
              center: 'Page [page] of [topage]',
              font_size: 8
              },
              margin: { top:  20, bottom: 10}

            )
        send_data pdf, filename: "RestaurantOrder_#{@restaurant_order.id}.pdf", type: 'application/pdf', disposition: 'inline'
      end
    end
  end
end
