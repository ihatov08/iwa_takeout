User.seed do |s|
  s.id = 1
  s.email = "host@gmail.com"
  s.password = "password"
  s.name = "host"
  s.confirmed_at = Time.current
end

User.seed do |s|
  s.id = 2
  s.email = "guest@gmail.com"
  s.password = "password"
  s.name = "guest"
  s.confirmed_at = Time.current
end
