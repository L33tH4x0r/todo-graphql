user = User.create(email: 'austin.turner@vitalsource.com', password: 'password1234', password_confirmation: 'password1234', username: 'austin.turner')
list = List.create(title: 'Example List', user: user)
