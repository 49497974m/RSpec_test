require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = build(:user)
  end

  describe "バリデーション" do

    it "名前とメールアドレス両方あれば登録できる" do
      expect(@user.valid?).to eq(true)
    end

    it "名前が空だと登録できない" do
      @user.name = ""
      expect(@user.valid?).to eq(false)
    end

    it "メールアドレスが空だと登録できない" do
      @user.email = ""
      expect(@user.valid?).to eq(false)
    end

    it "名前が重複してたら登録できない" do
      user1 = create(:user, name: "mana", email: "manamana@example.com")
      expect(build(:user, name: user1.name, email: "manachan@example.com")).to_not be_valid
    end

    it "メールアドレスが重複してたら登録できない" do
      user1 = create(:user, name: "mana", email: "manamana@example.com")
      expect(FactoryBot.build(:user, name: "manami", email: user1.email)).to_not be_valid
    end

  end

end
