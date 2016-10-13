class Order < ActiveRecord::Base

  belongs_to :dispatcher
  belongs_to :driver

  validates_uniqueness_of :id, scope: [:AdresFrom, :AdresTo, :date_of_trip,
                                       :phone_number]
  validates :phone_number, :AdresFrom, :AdresTo, presence: {
    message: 'пожалуйста, заполните обязательное поле'
  }
  validates :phone_number,
            length: { in: 6..11, message: 'номер должен состоять из 6-11 цифр' }
  validates :phone_number, numericality:
            { only_integer: true,
              message: 'используйте только цифры для ввода номера телефона' }
  validates :number_of_passengers, numericality:
            { greater_than_or_equal_to: 1, less_than: 9,
              message: 'количество пассажиров в одном заказе от 1 до 8' }
  validates_format_of :email, :allow_blank => true,
                      :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                      message: 'проверьте корректность ввода Email'
  validates_datetime :date_of_trip, :allow_blank => true,
                     :before => lambda { Date.current.next_month }

  validates_datetime :date_of_trip, :allow_blank => true,
                     :on_or_after => lambda {Date.current}
end
