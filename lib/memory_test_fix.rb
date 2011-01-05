def in_memory_database?
  dc = Rails.configuration.database_configuration[Rails.env]
  if (dc['database'] == ':memory:' or dc['dbfile'] == ':memory:')
    if ActiveRecord::Base.connection.class == ActiveRecord::ConnectionAdapters::SQLite3Adapter
      return true
    end
  end
  false
end

def verbosity
  Rails::Configuration.new.database_configuration[Rails.env]['verbosity']
end

def inform_using_in_memory
  puts "Creating sqlite :memory: database"
end

if in_memory_database?
  load_schema = lambda {
    load "#{Rails.root}/db/schema.rb" # use db agnostic schema by default
    #  ActiveRecord::Migrator.up('db/migrate') # use migrations
  }
  case verbosity
  when "silent"
    silence_stream(STDOUT, &load_schema)
  when "quiet"
    inform_using_in_memory
    silence_stream(STDOUT, &load_schema)
  else
    inform_using_in_memory
    load_schema.call
  end
end
