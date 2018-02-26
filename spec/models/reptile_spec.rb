require 'rails_helper'

FactoryBot.find_definitions

RSpec.describe Reptile, type: :model do

  before :each do
    @reptile = FactoryBot.build(:reptile)
  end

  context "Create" do

    describe "when attempts to create a reptile with name, gender and birthday" do
      it "should be valid" do        
        expect(@reptile.valid?).to be_truthy
        @reptile.save
        expect(Reptile.count).to eq(1)
      end
    end

    describe "when attempts to create a reptile without gender and birthday" do
      it "should be invalid" do
        reptile = build(:reptile, :gender=>nil, :birthday=>nil)
        expect(reptile.valid?).to be_falsey
      end
    end
  end

  context "Delete" do

    describe "when attempts do destroy a valid reptile" do
      it "should be destroyed" do       
        @reptile.save
        expect(Reptile.delete(@reptile)).to be_truthy
      end
    end

    describe "when attempts to destroy an unexistent reptile" do
      it "shoud be invalid" do        
        expect(Reptile.delete(@reptile)).to eq(0)
      end
    end
  end

  context "Update" do
    describe "when attempts to update an existent reptile" do
      it "should get updated" do
        
       reptile = reptile = build(:reptile, :name=> "Pai", :gender=>"M", :birthday=>'2017-01-01')
       reptile.save

       reptile.name="Mãe"
       reptile.save

       expect(reptile.name).to eq("Mãe")
       expect(reptile.gender).not_to eq("F")
       expect(reptile.birthday) == "2017-01-01"

      end
    end
  end
  

  end

#private 
  #def create_reptile(attributes={})
    #Reptile.new(
      #{:name=>"Reptile 1", :gender=>"F", :birthday=>"2018-02-02"}.merge(attributes)
      #)
  #end

