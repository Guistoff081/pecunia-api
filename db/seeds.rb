user = User.find_or_create_by(email: 'demo@pecuniapay.com.br', name: 'Demo User') do |user|
  user.password = 'Teste@1234'
  user.password_confirmation = 'Teste@1234'
end

10.times do
  FactoryBot.create(:transaction, user: user)
end
