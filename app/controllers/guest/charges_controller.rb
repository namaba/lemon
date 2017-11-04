class Guest::ChargesController < Guest

  before_action :set_plan,   only: [:create]
  before_action :set_coin,   only: [:create]
  before_action :set_plan_or_coin,   only: [:create]

  class NothingCharge < StandardError; end


  def new
  end

  # プラン変更
  def create
    raise NothingCharge if @plan.nil? && @coin.nil?

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail], #emailは暗号化されずに受け取れます
      :source  => params[:stripeToken] #めちゃめちゃな文字列です
    )

    if @plan.present?
      # サブスクリプション作成(支払い発生)
      subscription = Stripe::Subscription.create(
        :customer => customer.id,
        :plan => @plan
      )

      current_user.user_profile.plan = @plan
      current_user.user_profile.save!

    elsif @coin.present? && @amount.present?
      ###この操作で、決済をします
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
      )

      current_user.pay_coin += @coin
      current_user.status.save!
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  # コイン購入
  # def coin_charge
  #   # Amount in cents
  #   @amount = 500#引き落とす金額
  #   customer = Stripe::Customer.create(
  #     :email => params[:stripeEmail], #emailは暗号化されずに受け取れます
  #     :source  => params[:stripeToken] #めちゃめちゃな文字列です
  #   )

  #   ###この操作で、決済をします
  #   charge = Stripe::Charge.create(
  #     :customer    => customer.id,
  #     :amount      => @amount,
  #     :description => 'Rails Stripe customer',
  #     :currency    => 'usd'
  #   )

  # rescue Stripe::CardError => e
  #   flash[:error] = e.message
  #   redirect_to new_charge_path
  # end

  private
  # 現在使ってない
  def set_plan
    case params[:plan]
    when 'one_month'
      @plan = 'one_month'
    when 'three_months'
      @plan = 'three_months'
    when 'six_months'
      @plan = 'six_months'
    when 'one_year'
      @plan = 'one_year'
    else
      @plan = nil
    end
  end

  # 現在使ってない
  def set_coin
    case params[:coin]
    when 'ten_coins'
      @coin   = 10
      @amount = 980
    when 'fifty_coins'
      @coin   = 50
      @amount = 4980
    when 'one_hundred_coins'
      @coin   = 100
      @amount = 6980
    else
      @coin   = nil
      @amount = nil
    end
  end

  def set_plan_or_coin
    case params[:charge]
    when 'one_month'
      @plan   = 'one_month'
    when 'three_months'
      @plan   = 'three_months'
    when 'six_months'
      @plan   = 'six_months'
    when 'one_year'
      @plan   = 'one_year'
    when 'ten_coins'
      @coin   = t('charge.coin.ten_coins')
      @amount = t('charge.amount.ten_coins')
    when 'fifty_coins'
      @coin   = t('charge.coin.fifty_coins')
      @amount = t('charge.amount.fifty_coins')
    when 'one_hundred_coins'
      @coin   = t('charge.coin.one_hundreds_coins')
      @amount = t('charge.amount.one_hundreds_coins')
    else
      @plan   = nil
      @coin   = nil
      @amount = nil
    end
  end
end