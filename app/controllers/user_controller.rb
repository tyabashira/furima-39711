class UserController < ApplicationController
  
private
def user_params
  params.require(:user).permit(:user_name, :first_name, :last_name, :first_kana, :last_kana, :birth).merge(user_id: current_user.id)
end
end