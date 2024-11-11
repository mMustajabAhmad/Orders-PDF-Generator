class GroupOrdersController < ApplicationController
  include ActionController::MimeResponds
  include Pagy::Backend
  def show
    @order = Order.find_by(id: params[:id])
    Rails.logger.debug "Order: #{@order.inspect}"

    respond_to do |format|
      format.html
      format.pdf do
        pdf_html = ActionController::Base.new.render_to_string(
          template: 'orders/group_order',
          layout: 'pdf',
          locals: { order: @order, pagy: @pagy },
          page_size: 'A4',
          disable_smart_shrinking: true,
          enable_local_file_access: true
        )

        pdf = WickedPdf.new.pdf_from_string(pdf_html)
        send_data pdf, filename: 'GroupOrder.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
  end
end
