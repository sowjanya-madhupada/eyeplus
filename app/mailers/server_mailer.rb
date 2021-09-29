class ServerMailer < ApplicationMailer
	 def purchase
	  
	  mail(:to => $text, :subject => "Your order has been processed!")

  end

end
