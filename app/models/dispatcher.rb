#
class Dispatcher < ApplicationRecord
  has_many :orders
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
end
