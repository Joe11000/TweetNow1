def twitter_client
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = 'r4rkeUTgplIhdv1CYJrguQ'
    config.consumer_secret     = 'p7NHpPEyrQ7gnVoYMXARuYymAtCh0TWGWe2KwVp0o'
    config.access_token        = '1327618981-034zfrLzKSUSBq6rlM21Ye2ZlMJ33qwpJXqSnIr'
    config.access_token_secret = 'oPIvujAIv4l6xYki7tW9O8d15Kjcb74zuj1m64PQ'
  end
end
