[{role: :administrator, email: 'admin@teste.com', password: '123456'}].each do |user_seed|
  puts "Inserindo usuários #{user_seed[:email]}"

  user = User.find_or_initialize_by(email: user_seed[:email])
  user.role = user_seed[:role]
  user.email = user_seed[:email]
  user.password = user_seed[:password]
  user.password_confirmation = user_seed[:password]
  user.save
end
