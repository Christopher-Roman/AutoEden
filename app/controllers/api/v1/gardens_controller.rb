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
						message: 'See error message to find out what happened.',
						data: garden.errors
					}, status: :ok
				end
			end

		end
	end
end