class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  def index
    @orders = Order.where(status: [0..9]).order(:status)
    @drivers = Driver.all
  end

  def show
  end

  def archive
    @orders = Order.all
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @order = Order.new(order_params)

    @order.status = 4

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    #Если диспетчер залогинен, то при редактировании его id автоматически
    #вносится в dispatcher_id
    if current_dispatcher
      @order.dispatcher_id = current_dispatcher.id
    end
    #Если заказ Новый и назаначают водителя, то статус автоматически
    #становится "Отправлен водителю"
    if (params[:order][:driver_id] != '' and @order.status==4)
      @order.status = 5
    end
    #Если заказ отклонен или не принят водителем и назаначают нового водителя,
    #то статус автоматически становится "Отправлен водителю повторно"
    if (params[:order][:driver_id] != '' and @order.status<4)
      @order.status = 6
    end

    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:dispatcher_id, :driver_id, :status,
                                    :comment, :phone_number, :email,
                                    :number_of_passengers, :date_of_trip,
                                    :AdresFrom, :AdresTo)
    end
end
