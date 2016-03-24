require './app/models/user'

describe User do
  let!(:user) do
    User.create(email: 'cersei@house_lannister.co.we', password: 'jamie',
             password_confirmation: 'jamie')
    end
  describe '#authenticate' do
    it 'checking if password matches in database' do
      expect(User.authenticate(user.email, user.password)).to eq user
    end

    it 'doesnt match user in database' do
      expect(User.authenticate(user.email, 'robert')).to be_nil
    end
  end
end
