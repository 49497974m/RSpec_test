require 'rails_helper'

RSpec.describe User, type: :model do

   it "名前とメールアドレスがあれば登録できる" do
    expect(create(:user)).to be_valid
   end

   it "名前が無ければ登録できない" do
    expect(build(:user, name: "")).to_not be_valid
   end

   it "メールアドレスが無ければ登録できない" do
    expect(build(:user, email: "")).to_not be_valid
   end

   it "名前が重複してたら登録できない" do
    user1 = create(:user, name: "mana", email: "manamana@example.com")
    expect(build(:user, name: user1.name, email: "manachan@example.com")).to_not be_valid
   end

   it "メールアドレスが重複してたら登録できない" do
    user1 = create(:user, name: "mana", email: "manamana@example.com")
    expect(build(:user, name: "manami", email: user1.email)).to_not be_valid
   end

   it "メールアドレスのローカルパートが6文字以上でなければ登録できない" do
    expect(build(:user, email: "12345@example.com")).to_not be_valid
   end
end
