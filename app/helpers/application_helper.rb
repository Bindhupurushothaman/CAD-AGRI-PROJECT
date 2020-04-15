module ApplicationHelper
	def current_billing
		if !session[:billing_id].nil?
			Billing.find(session[:billing_id])
		else
			Billing.new
		end
	end
end
