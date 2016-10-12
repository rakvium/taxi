ActiveAdmin.setup do |config|
  config.site_title_image = 'http://www.google.com/images/logos/google_logo_41.png'
  config.site_title = 'Taxiproject'
  config.comments = false
  # config.namespace :admin do |admin|
  #   admin.build_menu :utility_navigation do |menu|
  #     menu.add label: 'ActiveAdmin.info', url: 'http://www.activeadmin.info',
  #                                         html_options: { target: :blank }
  #     admin.add_current_user_to_menu  menu
  #     admin.add_logout_button_to_menu menu
  #   end
  # end
  config.authentication_method = :authenticate_admin!
  config.current_user_method = :current_admin
  config.logout_link_path = :destroy_admin_session_path
  config.batch_actions = true
  config.localize_format = :long
end
