User.create(email: 'test@mail.com', first_name: 'Test', last_name: 'User',
            password: '123', password_confirmation: '123')

if User.count < 20
  User.create(
    email: 'test@mail.com',
    first_name: 'Test',
    last_name: 'User',
    password: '123',
    password_confirmation: '123'
  )
end