module Api
	module V1
		class JournalsController < ApplicationController

			def index
				journals = Journal.order('created_at DESC')
				render json: {
					status: 'Success!',
					message: 'Here are all of your journals',
					data: journals
				}, status: :ok
			end

			def show
				journal = Journal.find(params[:id])
				render json: {
					status: 'Success!',
					message: 'Here is the journal you requested.',
					data: journal
				}, status: :ok
			end

			def create
				journal = Journal.new(journal_params)
				if journal.save
					render json: {
						status: 'Success!',
						message: 'A New Journal was created!',
						data: journal
					}, status: :ok
				else
					render json: {
						status: 'Error',
						message: 'Something went wrong. See error info.',
						data: journal.errors
					}, status: :unprocessable_entity
				end
			end

			def update
				journal = Journal.find(params[:id])
				if journal.update_attributes(journal_params)
					render json: {
						status: 'Success!',
						message: 'Your journal has been updated.',
						data: journal
					}, status: :ok
				else
					render json: {
						status: 'Error',
						message: 'Something went wrong. See error info.',
						data: journal.errors
					}, status: :unprocessable_entity
				end
			end

			def destroy
				journal = Journal.find(params[:id])
				if journal.destroy
					render json: {
						status: 'Success',
						message: 'Journal was deleted',
						data: journal
					}, status: :ok
				else
					render json: {
						status: 'Error',
						message: 'Something went wrong. See error info.',
						data: journal.errors
					}, status: :unprocessable_entity
				end
			end

			private

			def journal_params
				params.permit(
					:journal_name,
					:journal_type,
					:archive,
					:user_id
				)
			end
		end
	end
end