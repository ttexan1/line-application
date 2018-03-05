Relationship.seed do |s|
  s.id = 1
  s.from_user_id = 1
  s.to_user_id = 2
  s.group_id = 1
end
Relationship.seed do |s|
  s.id = 2
  s.from_user_id = 1
  s.to_user_id = 3
  s.group_id = 3
end
Relationship.seed do |s|
  s.id = 3
  s.from_user_id = 1
  s.to_user_id = 4
  s.group_id = 4
end
Relationship.seed do |s|
  s.id = 4
  s.from_user_id = 2
  s.to_user_id = 3
  s.group_id = 5
end
