require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :dispatcher_id => 2,
        :driver_id => 3,
        :status => 4,
        :comment => "MyText",
        :phone_number => "Phone Number",
        :email => "Email",
        :AdresFrom => "Adres1",
        :AdresTo => "Adres2",
        :number_of_passengers => 5
      ),
      Order.create!(
        :dispatcher_id => 2,
        :driver_id => 3,
        :status => 4,
        :comment => "MyText",
        :phone_number => "Phone Number",
        :email => "Email",
        :AdresFrom => "Adres1",
        :AdresTo => "Adres2",
        :number_of_passengers => 5
      )
    ])
  end

=begin
   it "renders a list of orders" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Adres1".to_s, :count => 2
    assert_select "tr>td", :text => "Adres2".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
=end
end
