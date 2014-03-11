require 'rspec'
require 'email'

describe Email do
  it 'is initialized with a email class' do
    new_email = Email.new('bert@sesame.com')
    new_email.should be_an_instance_of Email
  end

  it 'is initialized with email number' do
    new_email = Email.new('bert@sesame.com')
    new_email.email.should eq "bert@sesame.com"
  end

  describe '.all' do
    it 'is empty at first' do
      Email.all.should eq []
    end

    it 'should display an array of one email after using the add method one time' do
      new_email = Email.new('bert@sesame.com')
      new_email.add
      Email.all.should eq [new_email]
    end
  end

  describe '.create' do
    it 'creates an intialized email instance' do
      new_email = Email.create('bert@sesame.com')
      new_email.email.should eq "bert@sesame.com"
    end
  end
end
