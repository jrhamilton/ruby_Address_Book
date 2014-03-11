require 'rspec'
require 'address'

describe Address do
  it 'is initialized with a address class' do
    new_address = Address.new('123 5th Ave, Portland, Oregon')
    new_address.should be_an_instance_of Address
  end

  it 'is initialized with address' do
    new_address = Address.new('123 5th Ave, Portland, Oregon')
    new_address.address.should eq '123 5th Ave, Portland, Oregon'
  end

  describe '.all' do
    it 'is empty at first' do
      Address.all.should eq []
    end

    it 'should display an array of one address after using the add method one time' do
      new_address = Address.new('123 5th Ave, Portland, Oregon')
      new_address.add
      Address.all.should eq [new_address]
    end
  end

  describe '.create' do
    it 'creates an intialized address instance' do
      new_address = Address.create('123 5th Ave, Portland, Oregon')
      new_address.address.should eq '123 5th Ave, Portland, Oregon'
    end
  end
end
