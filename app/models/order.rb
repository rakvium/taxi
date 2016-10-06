class Order < ActiveRecord::Base
  #validates  uniqueness: { scope: [:AdresFrom, :AdresTo, :phone_number] }
  validates_uniqueness_of :id, scope: [:AdresFrom, :AdresTo, :date_of_trip, :phone_number]
  validates :phone_number, :AdresFrom, :AdresTo, presence: {
    message: 'Пожалуйста, заполните обязательные поля'
  }
  validates :phone_number, length: { minimum: 6,
    message: 'Номер должен состоять из 6 и более символов' }
end
