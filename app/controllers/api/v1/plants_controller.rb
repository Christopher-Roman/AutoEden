module Api
	module V1
		class PlantsController < ApplicationController

			def index
				plants = Plant.order('created_at DESC')
				render json: {
					status: 'Success!',
					message: 'Here are all of your plants',
					data: plants
				}, status: :ok
			end

			def show
				plant = Plant.find(params[:id])
				render json: {
					status: 'Success!',
					message: 'Here is the journal you requested.',
					data: plant
				}, status: :ok
			end

			def create
				plant = Plant.new(plant_params)
				if plant.save
					render json: {
						status: 'Success!',
						message: 'A New Plant was created!',
						data: plant
					}, status: :ok
				else
					render json: {
						status: 'Error',
						message: 'Something went wrong. See error info.',
						data: plant.errors
					}, status: :unprocessable_entity
				end
			end

			def update
				plant = Plant.find(params[:id])
				if plant.update_attributes(plant_params)
					render json: {
						status: 'Success!',
						message: 'Your Plant has been updated.',
						data: plant
					}, status: :ok
				else
					render json: {
						status: 'Error',
						message: 'Something went wrong. See error info.',
						data: plant.errors
					}, status: :unprocessable_entity
				end
			end

			def destroy
				plant = Plant.find(params[:id])
				if plant.destroy
					render json: {
						status: 'Success',
						message: 'Plant was deleted',
						data: plant
					}, status: :ok
				else
					render json: {
						status: 'Error',
						message: 'Something went wrong. See error info.',
						data: plant.errors
					}, status: :unprocessable_entity
				end
			end

			private

			def plant_params
				params.permit(
					:plant_name,
					:plant_type,
					:flowering,
					:growth_state,
					:garden_id
				)
			end
		end
	end
end