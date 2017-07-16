# テスト
Rails.configuration.stripe = {
  :publishable_key => 'pk_test_80B56RDByOkzlDx0yLGkiXU7',#stipeのページに行って自分のアカウントから取ってくる
  :secret_key      => 'sk_test_cVqlJhLR4QqtXwlKEgYjsjv8'
}

# 本番
# Rails.configuration.stripe = {
#   :publishable_key => 'pk_live_iRfSclzOqRLcHfqBZmB3sN4s',#stipeのページに行って自分のアカウントから取ってくる
#   :secret_key      => 'sk_live_suPRBWiu0UaIq6lQ8qoNN69a'
# }

Stripe.api_key = Rails.configuration.stripe[:secret_key]