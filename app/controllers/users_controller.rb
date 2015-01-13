class UsersController < ApplicationController

	def index
		@usuarios = User.all
	end

	def show
		@usuario = User.find(params[:id])
	end

	def destroy
		User.find(params[:id]).destroy
		redirect_to users_url
	end
end