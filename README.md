# BehaviorLens

BehaviorLens is a Ruby gem designed to provide insights into user behavior and interaction patterns, enabling developers to understand and optimize user experiences.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'behavior_lens'
```

Then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install behavior_lens
```

## Database Setup

BehaviorLens requires a MySQL database to store tracked data.

### 1. Create a Database
```sql
CREATE DATABASE behavior_lens;
```

### 2. Connect to database
```ruby
require 'behavior_lens'

BehaviorLens::Database.connect(
  database: 'your_database_name',
  username: 'your_username',
  password: 'your_password',
  host: 'your_host' # Usually 'localhost'
)
```
### 3. Initialize the Database Schema
```ruby
BehaviorLens::Database.setup
```

## Usage

To use BehaviorLens in your project, require the gem and start analyzing behavior patterns. Here's a quick example:

```ruby
require 'behavior_lens'

# Example: Analyzing a set of user actions
analyzer = BehaviorLens::Analyzer.new
analyzer.track("user_clicked_button")
analyzer.track("user_scrolled_page")

report = analyzer.generate_report
puts report
```

Detailed documentation for advanced usage will be available soon.

## Development

To get started with development:

1. Clone the repository:

   ```bash
   git clone https://github.com/aayush502/behavior_lens.git
   cd behavior_lens
   ```

2. Install dependencies:

   ```bash
   bin/setup
   ```

3. Run the interactive console for experimentation:

   ```bash
   bin/console
   ```

4. To build and install the gem locally:

   ```bash
   bundle exec rake install
   ```

5. To release a new version:

   - Update the version number in `lib/behavior_lens/version.rb`.
   - Run:
     ```bash
     bundle exec rake release
     ```
   - This will tag the version, push changes to GitHub, and publish the gem to [RubyGems](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/aayush502/behavior\_lens](https://github.com/aayush502/behavior_lens). Contributions are expected to adhere to the [Code of Conduct](https://github.com/aayush502/behavior_lens/blob/main/CODE_OF_CONDUCT.md).

## License

BehaviorLens is open source and available under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

All participants in the BehaviorLens project are expected to follow the [Code of Conduct](https://github.com/aayush502/behavior_lens/blob/main/CODE_OF_CONDUCT.md).
