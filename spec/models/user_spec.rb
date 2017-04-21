require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:username).when('skohto', 'mkaiba') }
  it { should_not have_valid(:username).when('', nil) }

  it { should have_valid(:email).when('Bob@gmail.com', 'Brianna@test.com') }
  it do
    should_not have_valid(:email).when('', nil, 'bob', 'bob@gmail', 'bob.com')
  end

  it 'has a matching password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
