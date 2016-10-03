require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      :dispatcher_id => 1,
      :driver_id => 1,
      :status => 1,
      :comment => "MyText",
      :phone_number => "MyString",
      :email => "MyString",
      :rote => "MyText",
      :number_of_passengers => 1
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input#order_dispatcher_id[name=?]", "order[dispatcher_id]"

      assert_select "input#order_driver_id[name=?]", "order[driver_id]"

      assert_select "input#order_status[name=?]", "order[status]"

      assert_select "textarea#order_comment[name=?]", "order[comment]"

      assert_select "input#order_phone_number[name=?]", "order[phone_number]"

      assert_select "input#order_email[name=?]", "order[email]"

      assert_select "textarea#order_rote[name=?]", "order[rote]"

      assert_select "input#order_number_of_passengers[name=?]", "order[number_of_passengers]"
    end
  end
end
