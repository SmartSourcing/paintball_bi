== Welcome to paintball-reporting ( jruby rails application based on mondriap-olap )

== Installation

Dependencies:

* Java sdk 
* Mondrian olap server
* rbenv

To Install:

    $ brew install rbenv
    $ rbenv install jruby-1.7.0
    $ rbenv rehash
    $ export PATH="~/.rbenv/versions/jruby-1.7.0/bin/jruby:$PATH"
    $ jruby -S gem install bundler
    $ jruby -S gem install activerecord-jdbcmysql-adapter
    $ jruby -S bundle install
    $ jruby --2.0 -S  rake db:create
    $ jruby --2.0 -S  rake db:migrate
    $ jruby --2.0 -S  rake db:seed
    $ jruby --2.0 -S  rake db:seed:players
    $ jruby --2.0 -S  rake db:seed:nationalities
    $ jruby --2.0 -S  rake db:seed:cube
    $ jruby -S rails server

if encounter weird gcc library exceptions try to install gcc and g++ 4.6 then soft link them and try to run the server again.

    ln -s /usr/bin/gcc-4.6 gcc <br/>
    ln -s /usr/bin/g++-4.6 g++


