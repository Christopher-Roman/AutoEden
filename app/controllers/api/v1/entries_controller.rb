module Api
	module V1
		class EntriesController < ApplicationController

			def index
				entries = Entry.order('created_at DESC')
				render json: {
					status: 'Success!',
					message: 'Here are all of your journal entries',
					data: entries
				}, status: :ok
			end

			def show
				entry = Entry.find(params[:id])
				render json: {
					status: 'Success!',
					message: 'Here is the journal entry you requested.',
					data: entry
				}, status: :ok
			end

			def create
				entry = Entry.new(entry_params)
				if entry.save
					render json: {
						status: 'Success!',
						message: 'A New Journal Entry was created!',
						data: entry
					}, status: :ok
				else
					render json: {
						status: 'Error',
						message: 'Something went wrong. See error info.',
						data: entry.errors
					}, status: :unprocessable_entity
				end
			end

			def update
				entry = Entry.find(params[:id])
				if entry.update_attributes(entry_params)
					render json: {
						status: 'Success!',
						message: 'Your journal entry has been updated.',
						data: entry
					}, status: :ok
				else
					render json: {
						status: 'Error',
						message: 'Something went wrong. See error info.',
						data: entry.errors
					}, status: :unprocessable_entity
				end
			end

			def destroy
				entry = Entry.find(params[:id])
				if entry.destroy
					render json: {
						status: 'Success',
						message: 'Journal entry was deleted',
						data: entry
					}, status: :ok
				else
					render json: {
						status: 'Error',
						message: 'Something went wrong. See error info.',
						data: entry.errors
					}, status: :unprocessable_entity
				end
			end

			private

			def entry_params
				params.permit(
					:feeding_day,
					:watering_day,
					:defoil,
					:training_applied,
					:water_ph_levels,
					:soil_ph_levels,
					:nutrients_used,
					:temp,
					:relative_humidity,
					:explanation,
					:notes,
					:journal_id
				)
			end
		end
	end
end