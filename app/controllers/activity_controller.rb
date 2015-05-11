class ActivityController < ApplicationController
	def index
		user = current_user
		@transactions = {}
		counter = 0
		user.stocks.each do |s|
			s.transactions.each do |t|
				@transactions[counter] = t
	    		counter = counter + 1
			end
		end
		@transactions = user.transactions.order('created_at DESC')
	end
end
