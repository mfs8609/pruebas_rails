class UsersController < ApplicationController

	def index
		@usuarios = User.all
	end

	def new
		@usuario = User.new
	end

	def create
		@usuario = User.new(user_params)
		if @usuario.save
			redirect_to user_url(@usuario.id)
		else
			render action: 'new'
		end
	end

	def show
		@usuario = User.find(params[:id])
	end

	def edit
		@usuario = User.find(params[:id])
	end

	def update
		@usuario = User.find(params[:id])
		if @usuario.update_attributes(user_params)
			redirect_to user_url(@usuario.id)
		else
			render action: 'edit'
		end
	end

	def destroy
		User.find(params[:id]).destroy
		redirect_to users_url
	end

	def user_params
		params.require(:user).permit(:nombre, :email)
	end
end