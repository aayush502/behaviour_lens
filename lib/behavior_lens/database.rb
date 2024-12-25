require 'active_record'

module BehaviorLens
  class Database
    def self.connect(database: 'behavior_lens.db')
      ActiveRecord::Base.establish_connection(
        adapter: 'sqlite3',
        database: database
      )
    end

    def self.setup
      ActiveRecord::Schema.define do
        create_table :clicks, if_not_exists: true do |t|
          t.string :link, null: false
          t.integer :count, default: 1
          t.timestamps
        end
        create_table :sessions, if_not_exists: true do |t|
          t.string :user_id, null: false
          t.timestamps
        end
        create_table :events, if_not_exists: true do |t|
          t.string :name, null: false
          t.json :metadata
          t.timestamps
        end
      end
    end
  end
end
