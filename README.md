== Welcome to paintball-reporting ( jruby rails application based on mondriap-olap )

== Installation

Dependencies:

* Java sdk 
* Mondrian olap server
* rbenv
* jruby-1.7.25

To Install:

    $ brew install rbenv
    $ rbenv install jruby-1.7.25
    $ rbenv rehash
    $ export PATH="~/.rbenv/versions/jruby-1.7.25/bin/jruby:$PATH"
    $ jruby -S gem install bundler
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

if you encounter this problem: "Illegal key size: possibly you need to install Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files for your JRE"


    1) Download these from oracle :

        http://www.oracle.com/technetwork/java/javase/downloads/jce-7-download-432124.html

    2) copy the files here or wherever your jre path is.
    
        /Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home/jre/lib/security
