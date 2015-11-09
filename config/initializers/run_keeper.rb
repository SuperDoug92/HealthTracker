HealthGraph.configure do |config|
  config.client_id = '43862719c0614521b69e025bb95b2eda'
  config.client_secret = '4f53c0b27a69459f8a74de537b6aebe0'
  config.authorization_redirect_url = 'localhost:3000'
end

# auth_url = HealthGraph.authorize_url
#
# access_token = HealthGraph.access_token('2d815d7d08544ac78cdbd5a2808d10e7')
# puts "runkeeper access_token"
# puts access_token
