[travis]: https://travis-ci.com/rom-rb/rom-rb.org
[chat]: https://rom-rb.zulipchat.com

# rom-rb.org [![Join the chat at https://rom-rb.zulipchat.com](https://img.shields.io/badge/rom--rb-join%20chat-942283.svg)][chat]

[![Build Status](https://travis-ci.com/rom-rb/rom-rb.org.svg?branch=master)][travis]

The official rom-rb website.

## Build Instructions

1. Install gem dependencies:

   ```shell
   bundle install
    ```

2. Install node dependencies:

   ```shell
   npm install
   ```

   or

   ```shell
   yarn
   ```

3. Serve locally at [http://localhost:4567](http://localhost:4567):

   ```shell
   bundle exec middleman server
   ```

   or build to `/build`:

   ```shell
   bundle exec middleman build
   ```

 ## Windows Instructions
 If you're getting the following error:
 
 ```
 Unable to load the EventMachine C extension; To use the pure-ruby reactor, require 'em/pure_ruby'
 ```
 
 or features such as Live Reload are not working then it's because the
 C extension for eventmachine needs to be installed.
 
 ```
 gem uninstall eventmachine
 ```
 
 take note of the version being used. (At the time of writing '1.2.0.1')
 
 ```
 gem install eventmachine -v '[VERSION]' --platform=ruby
 ```
 
 If you have a proper environment with DevKit installed then eventmachine with its
 C extension will be installed and everything will work fine.
