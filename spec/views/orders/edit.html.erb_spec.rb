require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @drivers = assign(:drivers, [
      Driver.create!(
      :name => 'Ivan',
      :phone_number_string => '09365479815',
      :status => 0,
      :email => 'ivan@example.com',
      :password => '123456'
      ),
            Driver.create!(
      :name => 'Petro',
      :phone_number_string => '09365479815',
      :status => 0,
      :email => 'petro@example.com',
      :password => '123456'
      )
    ])

    @order = assign(:order, Order.create!(
      :dispatcher_id => 1,
      :driver_id => 1,
      :status => 1,
      :comment => "MyText",
      :phone_number => "MyString",
      :email => "MyString",
      :AdresFrom => "Adres1",
      :AdresTo => "Adres2",
      :number_of_passengers => 1
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do
      assert_select "textarea#order_comment[name=?]", "order[comment]"

      assert_select "input#order_phone_number[name=?]", "order[phone_number]"

      assert_select "input#order_email[name=?]", "order[email]"

      assert_select "input#order_AdresFrom[name=?]", "order[AdresFrom]"

      assert_select "input#order_AdresTo[name=?]", "order[AdresTo]"

      assert_select "input#order_number_of_passengers[name=?]", "order[number_of_passengers]"
    end
  end
end
