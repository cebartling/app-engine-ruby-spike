# app-engine-ruby-spike
A simple Ruby on Rails spike solution deployed to Google's App Engine Managed VMs infrastructure.

# Prerequisites

- MySQL for local development.  You can install it directly or use it within a Docker container.
- [Google Cloud SDK](https://cloud.google.com/sdk/).  

# Creating the Ruby on Rails App Engine application

1. [Install rbenv](https://github.com/sstephenson/rbenv#installation).
1. Install latest Ruby through rbenv: `rbenv install 2.2.3`
1. Create *.ruby-version* file in the repository root.  Set the contents of the file to be `2.2.3` and save the file.
1. Install Rails: `gem install rails`
1. Create a new Rails app in the current directory: `rails new .` 

# Configure the local MySQL database


# Using devise
[Devise](https://github.com/plataformatec/devise) is a Ruby gem for flexible authentication solution for Rails based on Warden.  It’s very popular with the Rails crowd and we’re going to use it in this spike solution application. Check out their [documentation](http://devise.plataformatec.com.br/) to see all the great support devise gives you for managing authentication and accounts.

1. Add `gem ‘devise’` to the main section of the *Gemfile*.
1. Run `bundle install` to pull down the gem dependency.
1. Run `rails generate devise:install` to install the devise initializer configuration into the Rails application.
1. Run `rails generate devise User` to configure the **User** model for management under devise.
1. Add the following line to the **config/environments/development.rb** file: `config.action_mailer.default_url_options = { host: ‘localhost’, port: 3000 }`
1. Migrate the database to get the new **users** table created in the database: `bundle exec rake db:migrate` 
    

# Using the puma web server

[Puma](https://github.com/puma/puma) is a simple, fast, threaded, and highly concurrent HTTP 1.1 server for Ruby/Rack applications. 

1. Add the following line to the *Gemfile*: `gem ‘puma’`
1. Run `bundle install` to install the gem into your Rails app environment.
1. Create a new file, **config/puma.rb**, and paste the following source code into the new file and save the file: 

        workers Integer(ENV.fetch(‘WEB_CONCURRENCY’, 1))
        threads Integer(ENV.fetch(‘MIN_THREADS’, 2)),
                Integer(ENV.fetch(‘MAX_THREADS’, 2))

        preload_app!

        rackup DefaultRackup
        port ENV.fetch(‘PORT’, 3000)
        environment ENV.fetch(‘RACK_ENV’, ‘development’)

        on_worker_boot do
             # Force reconnection for each worker
             ActiveRecord::Base.establish_connection
        end


1. Start your Rails server and ensure that Puma starts up: `rails server`




