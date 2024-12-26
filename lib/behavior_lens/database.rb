require 'active_record'

module BehaviorLens
  class Database
    def self.connect(database, username, password, host)
      ActiveRecord::Base.establish_connection(
        adapter: 'mysql2',
        host: host,
        database: database,
        username: username,
        password: password
      )
    end

    def self.setup
      ActiveRecord::Schema.define do
        connection = ActiveRecord::Base.connection

        # Check and create 'clicks' table
        unless connection.data_source_exists?('clicks')
          create_table :clicks do |t|
            t.string :link, null: false
            t.integer :count, default: 1
            t.timestamps
          end
        end

        # Check and create 'sessions' table
        unless connection.data_source_exists?('sessions')
          create_table :sessions do |t|
            t.string :user_id, null: false
            t.datetime :start_time
            t.datetime :end_time
            t.timestamps
          end
        end

        # Check and create 'events' table
        unless connection.data_source_exists?('events')
          create_table :events do |t|
            t.string :name, null: false
            t.json :metadata # JSON is fully supported in MySQL with ActiveRecord 7+
            t.timestamps
          end
        end
      end
    end
  end
end
