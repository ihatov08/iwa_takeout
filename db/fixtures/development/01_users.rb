User.seed do |s|
  s.id = 1
  s.email = "host@gmail.com"
  s.password = "password"
  s.name = "host"
end

User.seed do |s|
  s.id = 2
  s.email = "guest@gmail.com"
  s.password = "password"
  s.name = "guest"
end
