set :user, 'deploy'
server '128.199.231.145', user: fetch(:user), roles: %w{web app db}
set :application, 'fyp_staging'
set :rails_env, 'staging'
set :release_note_url, 'http://staging.fyp.com/release_note.txt'