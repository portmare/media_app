# User's session

class UserSession < Authlogic::Session::Base
  authenticate_with User
end