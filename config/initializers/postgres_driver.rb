if Rails.env == 'development'
  $CLASSPATH << 'file:/Users/aleg/.rbenv/versions/jruby-1.7.0/lib/ruby/gems/shared/gems/jdbc-postgres-9.4.1200/lib/postgresql-9.4-1200.jdbc4.jar'
else
  $CLASSPATH << '/home/ubuntu/.rbenv/versions/jruby-1.7.17/lib/ruby/gems/shared/gems/jdbc-postgres-9.4.1200/lib/postgresql-9.4-1200.jdbc4.jar'
end
