require 'rails_helper'

RSpec.describe Reptile, type: :model do
  context "Create" do
    it "valid?" do
      reptile = Reptile.new
      reptile.name = 'Mãe '
      reptile.gender = 'F'
      reptile.birthday = '2018-02-02'

      expect(reptile.valid?).to be_truthy
    end

    it "invalid?" do
      reptile = Reptile.new
      reptile.name = 'Mãe '
      reptile.gender = nil
      reptile.birthday = nil

      expect(reptile.valid?).to be_falsey
    end
  end

  context "Delete" do
    it "destroyed?"do
      reptile = Reptile.new
      reptile.name = 'Mãe '
      reptile.gender = 'F'
      reptile.birthday = '2018-02-02'

      reptile.save

      expect(Reptile.delete(reptile)).to be_truthy
    end
  end

end
