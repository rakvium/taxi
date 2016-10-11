class Order < ActiveRecord::Base

  belongs_to :dispathcer

  validates_uniqueness_of :id, scope: [:AdresFrom, :AdresTo, :date_of_trip, :phone_number]
  validates :phone_number, :AdresFrom, :AdresTo, presence: {
    message: 'Пожалуйста, заполните обязательные поля'
  }
  validates :phone_number, length: { minimum: 6,
    message: 'Номер должен состоять из 6 и более символов' }
  validates :number_of_passengers, numericality: { greater_than_or_equal_to: 1,
    message: 'Минимальное кол-во пассажиров - 1' }


end
