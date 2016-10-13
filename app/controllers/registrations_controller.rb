#
class RegistrationsController < Devise::RegistrationsController
  def sign_up_params
    params.require(:driver).permit(:email, :password, :password_confirmation,
                                   :name, :phone_number_string, :license_plate,
                                   :car_model, :car_color, :car_type,
                                   upload: [:tempfile, :original_filename,
                                            :content_type, :headers])
  end

  def update_params
    params.require(:driver).permit(:email, :password, :password_confirmation,
                                   :current_password, :name,
                                   :phone_number_string, :license_plate,
                                   :car_model, :car_color, :car_type,
                                   upload: [:tempfile, :original_filename,
                                            :content_type, :headers])
  en
end
