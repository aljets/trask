# Trask, for Rails

Most Content Management Systems try to do a lot. Trask tries to do very little, so it doesn't get in the way. Trask is perfect for when you want full control over your project and layout, but just want to make certain sections editable so development doesn't need to own content.

This is a content management solution for developers.

Use with ActiveRecord, or modify PageWrapper and use it with a service.

## Installation

Add this line to your application's Gemfile:

    gem 'trask'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install trask


If you are not using a service to store your content, run the rake task to create a pages, html_content, html_revisions, collection_items, and collection_placements tables:
    $ rake trask:install:migrations


## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/trask/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
