require 'rails_helper'

RSpec.describe User, type: :model do
  it '有 email' do
    user = User.new email: 'heycn@1.com'
    expect(user.email).to eq 'heycn@1.com'
  end
end
