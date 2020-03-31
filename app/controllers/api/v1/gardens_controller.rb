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

		end
	end
end