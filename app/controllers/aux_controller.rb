class AuxController < ApplicationController
  def add_to_cart
    order = spree_current_user.orders.first_or_create

    line_item = Spree::LineItem.find_by(variant_id: params[:id])

    if line_item
      line_item.update(quantity: line_item.quantity + 1)
    else
      Spree::LineItem.create(variant_id: params[:id], quantity: 1, order_id: order.id)
    end

    Spree::OrderUpdater.new(order).update

    render json: {total_items: order.line_items.count}
  end
end
