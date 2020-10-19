class HomeController < ApplicationController
  def index; end

  def get_users
    respond_to do |format|
      format.json do
        users_pagination = User.where.not(id: current_user.id).page(params[:page].inspect || 1)
        render json: {
            total_count: users_pagination.total_count,
            users: users_pagination.all
        }
      end
      format.html do
        @users = User.where.not(id: current_user.id).all
        send_data(render_to_string(template: '/home/get_users', layout: false), filename: "#{current_user.name}.html")
      end
    end
  end
end
