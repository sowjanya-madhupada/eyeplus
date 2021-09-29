class GalleryController < ApplicationController
  def index
  	@products=Store.all
  end

  def search
  	# Send requests to the gateway's test servers
    keyword="%"+params[:search].to_s+"%"
    @products=Store.find_by_sql ["Select * from stores WHERE glasses_type like? or gender like? or frame_type like? or brand like? or color like?",keyword,keyword,keyword,keyword,keyword]
  	
  end
def checkout
  if request.post?
      amount=session[:amount] 
ActiveMerchant::Billing::Base.mode = :test

# Create a new credit card object
credit_card = ActiveMerchant::Billing::CreditCard.new(
  :number     => params[:credit_card_no],
  :month      => params[:month],
  :year       => params[:year  ],
  :first_name => params[:first_name],
  :last_name  => params[:last_name],
  :verification_value  => params[:verification_number],
)

if credit_card.valid?
  # Create a gateway object to the TrustCommerce service
  gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
    :login    => 'TestMerchant',
    :password => 'password'
  )

  # Authorize for $10 dollars (1000 cents)
  response = gateway.authorize(amount.to_i,credit_card)

  if response.success?
    # Capture the money
    ServerMailer.purchase.deliver
    session[:cart]=nil
    gateway.capture(amount.to_i, response.authorization)
    redirect_to :action=>:purchase_complete
  end
  else
    flash[:notice]="Invalid card"
    render :action=>:checkout
  end

  end
  end
end
