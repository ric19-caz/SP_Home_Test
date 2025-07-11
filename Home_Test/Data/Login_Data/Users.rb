# Data/Login_Data/Users.rb

require_relative 'Admin_User_Credentials'

module Users
  def self.get(user_type)
    case user_type
    when :admin
      {
        email: AdminUser::USER_EMAIL,
        password: AdminUser::USER_PASSWORD,
        url: AdminUser::SIMPLE_PRACTICE_URL
      }
    else
      raise "User type '#{user_type}' not recognized"
    end
  end
end