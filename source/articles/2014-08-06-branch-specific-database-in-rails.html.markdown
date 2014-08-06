---
title: Branch Specific Databases in Rails
date: 2014-08-06 14:07 UTC
tags: ruby, rails, database, git
---

If you've worked on a Rails project for any length of time and you use feature branches (you really should be), you quickly run into migrations "leaking" across your git branches.

Sometimes it isn't a big deal, a missing field here, an extra field there -- you learn to ignore errors. This is a bad idea, since then you'll just dismiss the important errors too.

A technique I've started using (and I'm not the only one) is to use branch specific database tables. It's exactly what it sounds like: every feature branch has its own database.

What's different about the way I've solved this problem from others, is that branching the database is entirely optional. If you want to start working on a branched database, you just `rake db:branch` and when you're done, you can `rake db:unbranch` to clean it up. 

Plus, if you're not really working with migrations or just don't want the hassle of branching your database, just don't run the rake commands and the default rails pattern of `APPLICATION_ENVIRONMENT` gets used.

## Installing Dependencies
First, you'll need to add the [git gem](https://github.com/schacon/ruby-git) to your bundle and then install it `bin/bundle install`.

```ruby
group :development do
	gem 'git'
end
```

We also need a simple class in `/lib` that figures out which database we should be using.

> NOTE: This only works for MySQL. If you're using another ActiveRecord-supported database server, you'll have to change `#existing_databases` to something that will spit out the list of databases.

```ruby
class BranchedDatabase
  def self.name(*args)
    new.name(*args)
  end

  def current_branch
    Git.open('.').current_branch.parameterize
  end

  def existing_databases
    if ENV['DB_PASSWORD'].present?
      password = "-p#{ENV['DB_PASSWORD']}"
    end
    `mysql -u #{ENV['DB_USER']} #{password} -h #{ENV['DB_HOST']} -e \"show databases\"`.chomp.split
  end

  def name(prefix: application_name, separator: '_')
    branch_database = [prefix, current_branch].join(separator)
    if existing_databases.include?(branch_database)
      branch_database
    else
      [prefix, Rails.env].join(separator)
    end
  end

  def application_name
    Rails.application.class.name.split('::').first.downcase
  end
end
```

## Updating database.yml

With the prerequisites in place, it's time to modify the `database.yml` to use the detected branch name. 

```yml
development: 
  database:  <%= BranchedDatabase.name %>
test:
  <<: *defaults
  database: myApplication_test
production:
  <<: *defaults
  database:  myApplication_production
```

Even though I *could* use the branched naming scheme for the production environment, I prefer to be explicit here. Well, that, and the dependency won't be installed when deploying to production since it's in the `development` group in the Gemfile.

## Rake to the Rescue

There's only one thing left to do: remove some annoyances. 

I like adding a few rake tasks to run when starting or deleting branches. You could just run all the database related rake tasks directly, but I think these describe the intent a little bit better.

```ruby
namespace :db do
  desc 'Create branch specific database and load db/schema.rb'
  task :branch => [:create, 'schema:load', 'test:prepare']

  desc 'Remove the branch specific database'
  task :unbranch => 'branch:remove'

  namespace :branch do
    task :remove => :drop

    desc 'Remove then Create the branch specific database'
    task :reset => [:remove, :branch]
  end
end
```

It's important to note what the rake tasks *do not* do: any sort of error checking. If you're in a different branch (like develop) and execute `rake db:unbranch` you will drop your development database. 

You're a big boy developer, you don't need your hand held -- don't be stupid and you'll be okay.

## Getting to Work

With that, we're done - just a matter of using it.

```bash
git checkout -b feature/new-feature-branch
bin/rake db:branch
...
git push -u origin feature/new-feature-branch
...
bin/rake db:unbranch
git checkout develop
git branch -d feature/new-feature-branch
```




