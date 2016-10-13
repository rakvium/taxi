require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :dispatcher_id => 2,
      :driver_id => 3,
      :status => 4,
      :comment => "MyText",
      :phone_number => 123456,
      :email => "email@example.com",
      :AdresFrom => "Adres1",
      :AdresTo => "Adres2",
      :number_of_passengers => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/123456/)
    expect(rendered).to match(/email@example.com/)
    expect(rendered).to match(/Adres1/)
    expect(rendered).to match(/Adres2/)
    expect(rendered).to match(/5/)
  end
end
