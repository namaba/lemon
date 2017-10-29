class Guest::ChargesController < Guest

  before_action :find_plan,   only: [:create]
  before_action :set_coin_charge,   only: [:coin_charge]

  def new
  end

  # プラン変更
  def create
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail], #emailは暗号化されずに受け取れます
      :source  => params[:stripeToken] #めちゃめちゃな文字列です
    )


    サブスクリプション作成(支払い発生)
    subscription = Stripe::Subscription.create(
      :customer => customer.id,
      :plan => @plan
    )

    current_user.user_profile.plan = @plan
    current_user.user_profile.save!

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  # コイン購入
  def coin_charge
    # Amount in cents
    @amount = 500#引き落とす金額
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

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private
    def find_plan
      if params[:plan] == 'one_month'
        @plan = 'one_month'
      elsif params[:plan] == 'three_months'
        @plan = 'three_months'
      elsif params[:plan] == 'six_months'
        @plan = 'six_months'
      elsif params[:plan] == "one_year"
        @plan = 'one_year'
      end
    end

    def set_coin_charge
      if params[:plan] == 'ten'
        @plan = 'ten'
      elsif params[:plan] == 'fifty'
        @plan = 'fifty'
      elsif params[:plan] == 'one_hundred'
        @plan = 'one_hundred'
      end
    end
end