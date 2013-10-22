# AzureAuth

azure_oauth uses 'Peerialism authentication HUB' web site that manages token exchanges with the Azure ACS, encryption etc.

## Installation

Add this line to your application's Gemfile:

    gem 'azure_oauth'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install azure_oauth

## Usage

1- Set "AUTH_URL", "DECODE_KEY" and "CALLBACK_URL" as an configuration variables.
    e.g. create "/config/initializers/azure_oauth.rb" contains these lines
    
    AUTH_URL 		= "http://url.com"	# 	The authentication url
	DECODE_KEY     	= "XXXXX.....XXXX"	#	the decoding key that used in encoding process
	CALLBACK_URL   	= "callback_url"	#	the callback url that will recieve the user email 
    
2- Use "/authenticate" url to start the authentication process.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request