class ServerMailer < ApplicationMailer
	 def purchase
	  
	  mail(:to => "sowjimadhupada@gmail.com", :subject => "Your order has been processed!")

  end

end
