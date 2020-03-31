module Api
	module V1
		class UsersController < ApplicationController

			def index
				users = User.order('created_at DESC')
				render json: {
					status: 'Success', 
					message: 'List of All Users', 
					data:users
				}, status: :ok
			end

			def show
				user = User.find(params[:id])
				if user
					render json: {
						status: 'Success',
						message: "Here is the requested profile!",
						data:user
					}, status: :ok
				else
					render json: {
						status: 'Hmmm, that was unexpected',
						message: 'Something went wrong, see error message',
						data:user.errors
					},status: :unprocessable_entity
				end
			end

			def create
				user = User.new(user_params)
				if user.save
					render json: {
						status: 'Success',
						message: "User profile created!",
						data:user
					}, status: :ok
				else
					render json: {
						status: 'Hmmm, that was unexpected',
						message: 'Something went wrong, see error message',
						data:user.errors
					},status: :unprocessable_entity
				end
			end

			def update
				user = User.find(params[:id])
				if user.update_attributes(user_params)
					render json: {
						status: 'Success',
						message: "Here is the updated information!",
						data:user
					}, status: :ok
				else
					render json: {
						status: 'Hmmm, that was unexpected',
						message: "Something went wrong. See error message",
						data:user.errors
					},status: :unprocessable_entity
				end
			end

			def destroy
				user = User.find(params[:id])
				if user.destroy
					render json: {
						status: 'Success',
						message: "User account was deleted as requested."
					}, status: :ok
				else
					render json: {
						status: 'Hmmm, that was unexpected',
						message: "Something went wrong. See error message",
						data:user.errors
					},status: :unprocessable_entity
				end
			end

			private

			def user_params
				params.permit(:username, :user_email, :gardening_experience, :nickname, :preferred_pronoun, :favorite_plant, :pref_gardening_medium, :country, :state_or_province)
			end

		end

	end

end
