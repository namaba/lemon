class Guest::ChargesController < Guest

  def new
  end

  def create
    # Amount in cents
    @amount = 500#引き落とす金額
  　　　 ###この操作で、Stripe から帰ってきた情報を取得します
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail], #emailは暗号化されずに受け取れます
      :source  => params[:stripeToken] #めちゃめちゃな文字列です
    )


    ###この操作で、決済をします
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    # サブスクリプション作成(支払い発生)
    # subscription = Stripe::Subscription.create(
    #   :customer => customer.id,
    #   :plan => @plan
    # )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end