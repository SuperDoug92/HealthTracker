HealthGraph.configure do |config|
  config.client_id = '43862719c0614521b69e025bb95b2eda'
  config.client_secret = '4f53c0b27a69459f8a74de537b6aebe0'
  config.authorization_redirect_url = 'http://localhost:3000'
end

auth_url = HealthGraph.authorize_url
puts "health graph"
puts auth_url
#
# access_token = HealthGraph.access_token('2d815d7d08544ac78cdbd5a2808d10e7')
# puts "access_token"
# puts access_token


# puts "runkeeper access_token"
# puts access_token


# require 'run_keeper'
#
# runkeeper = RunKeeper.new '43862719c0614521b69e025bb95b2eda', '4f53c0b27a69459f8a74de537b6aebe0'
# runkeeper.authorize_url 'http://localhost:3000'
# # => 'https://runkeeper.com/apps/authorize?response_type=code&client_id=client_id&redirect_uri=http%3A%2F%2Fyour.com%2Fcallback%2Furl'
#
# runkeeper.get_token '2d815d7d08544ac78cdbd5a2808d10e7', 'http://localhost:3000'
#
# # return the users profile
# runkeeper.profile
# # => RunKeeper::Profile
