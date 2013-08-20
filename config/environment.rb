# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'debugger'
require 'twitter'

require 'erb'

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')

  YOUR_APP_CONSUMER_KEY     = '2faArhuLdQCVzl0kas6x5A'
  YOUR_APP_CONSUMER_SECRET  = 'lFTFaw4eloWexdvelhOUib6JRRf91eXxua4lWo7pM'   
  A_USER_ACCESS_TOKEN       = '1327618981-ejXWtXoTevjw1dcwsdCd372fAdkRvgVOXrmTM3z'
  A_USER_ACCESS_SECRET      = 'bDKtAEJ3UmfhZ0wf1eu0MlDT1d53dAt9jjVRXa6w'
  