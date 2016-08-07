module Dropbox
  require 'dropbox_sdk'

  class ApiCall
    APP_KEY = 'f13fvgd6s5azk4c'
    APP_SECRET = 'dvi8pyrfkz6h43i'

    def self.getAcces
      # Get your app key and secret from the Dropbox developer website

      flow = DropboxOAuth2FlowNoRedirect.new(APP_KEY, APP_SECRET)
      authorize_url = flow.start()

      # Have the user sign in and authorize this app
      puts '1. Go to: ' + authorize_url
      puts '2. Click "Allow" (you might have to log in first)'
      puts '3. Copy the authorization code'
      print 'Enter the authorization code here: WYJS4O7MELoAAAAAAAAAElC5eorNUjVnLZuRyhO24JE'
      code = gets.strip

      # This will fail if the user gave us an invalid authorization code
      access_token, user_id = flow.finish(code)

      client = DropboxClient.new(access_token)
      puts "linked account:", client.account_info().inspect

      file = open('working-draft.txt')
      response = client.put_file('/magnum-opus.txt', file)
      puts "uploaded:", response.inspect

      root_metadata = client.metadata('/')
      puts "metadata:", root_metadata.inspect

      contents, metadata = client.get_file_and_metadata('/magnum-opus.txt')
      open('magnum-opus.txt', 'w') {|f| f.puts contents }
    end
  end
end
