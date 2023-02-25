require "rails_helper"

RSpec.describe User, type: :model do
  it "有 email" do
    user = User.new(email: "heycn@xxx.com")
    expect(user.email).to eq 'heycn@xxx.com'
  end
end
