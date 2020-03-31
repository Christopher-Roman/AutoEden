module Api
	module V1
		class GardensController < ApplicationController

			def index
				gardens = Garden.order('created_at DESC')
				render json: {
					status: 'Success',
					message: 'Here is a list of all user gardens',
					data: gardens
				}, status: :ok
			end

			def show
				garden = Garden.find(params[:id])
				if garden
					render json: {
						status: 'Success',
						message: 'Here is the requested garden.',
						data: garden
					}, status: :ok
				else
					render json: {
						status: 'Something went wrong.',
						message: error_message,
						data: garden.errors
					}, status: :ok
				end
			end

			def create
				garden = Garden.new(garden_params)
				if garden.save
					render json: {
						status: 'Success!',
						message: 'Garden was successfully added!',
						data: garden
					}, status: :ok
				else
					render json: {
						status: 'Something went wrong.',
						message: error_message,
						data: garden.errors
					}, status: :ok
				end
			end

			private

			def error_message
				'See error message to find out what happend.'
			end

			def garden_params
				params.permit(
					:garden_name,
					:garden_type,
					:garden_medium
				)
			end

		end
	end
end