class Ahoy::Store < Ahoy::Stores::LogStore
  # customize here
  Ahoy.track_visits_immediately = true
  Ahoy.quiet = false
end
