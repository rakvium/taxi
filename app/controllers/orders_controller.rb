class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.where(status: [0..9]).order(:status)
    @drivers = Driver.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  def archive
    @orders = Order.all
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    #params[:order][:rote] = params.delete(:adres_from) + '>>>' + params.delete(:adres_to)
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

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
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

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:dispatcher_id, :driver_id, :status,
                                    :comment, :phone_number, :email,
                                    :number_of_passengers, :date_of_trip,
                                    :AdresFrom, :AdresTo)
    end
end
