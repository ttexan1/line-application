Message.seed do |s|
  s.id = 1
  s.user_id = 1
  s.group_id = 1
  s.content = "talk1です"
end
Message.seed do |s|
  s.id = 2
  s.user_id = 1
  s.group_id = 2
  s.content = "talk2です"
end
Message.seed do |s|
  s.id = 3
  s.user_id = 2
  s.group_id = 1
  s.content = "talk3です"
end
Message.seed do |s|
  s.id = 4
  s.user_id = 2
  s.group_id = 2
  s.content = "talk4です"
end
Message.seed do |s|
  s.id = 5
  s.user_id = 2
  s.group_id = 3
  s.content = "talk5です"
end
