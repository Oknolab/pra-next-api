require 'rails_helper'

RSpec.describe User, type: :model do
  it "info returns {id, userName, age}" do
    user = create(:user)
    expect(user.info).to eq({ id: user.id.to_s, userName: user.name, age: user.age })
  end
end
