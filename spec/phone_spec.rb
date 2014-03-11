require 'rspec'
require 'phone'

describe Phone do
  it 'is initialized with a Phone class' do
    new_phone = Phone.new('555 555-5555')
    new_phone.should be_an_instance_of Phone
  end

  it 'is initialized with phone number' do
    new_phone = Phone.new('555 555-5555')
    new_phone.number.should eq "555 555-5555"
  end

  describe '.all' do
    it 'is empty at first' do
      Phone.all.should eq []
    end

    it 'should display an array of one phone after using the add method one time' do
      new_phone = Phone.new('555 555-5555')
      new_phone.add
      Phone.all.should eq [new_phone]
    end
  end

  describe '.create' do
    it 'creates an intialized phone instance' do
      new_phone = Phone.create('555 555-5555')
      new_phone.number.should eq "555 555-5555"
    end
  end
end
