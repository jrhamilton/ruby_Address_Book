require 'rspec'
require 'contact'

describe Contact do
  it 'is initailized with a Contact class' do
    new_contact = Contact.new("bob", '555 555-5555', 'bob@bob.com', '123 5th Ave, Portland, Oregon')
    new_contact.should be_an_instance_of Contact
  end

  it 'is initilized with a contact name' do
    new_contact = Contact.new("bob", '555 555-5555', 'bob@bob.com', '123 5th Ave, Portland, Oregon')
    new_contact.name.should eq "bob"
  end

  it 'is initialized with phone number, email and mailing address' do
    new_contact = Contact.new("bob", '555 555-5555', 'bob@bob.com', '123 5th Ave, Portland, Oregon')
    new_contact.email.should eq "bob@bob.com"
    new_contact.phone.should eq "555 555-5555"
    new_contact.address.should eq "123 5th Ave, Portland, Oregon"
  end

  describe '.all' do
    it 'is empty at first' do
      Contact.all.should eq []
    end

    it 'should display an array of one contact after using the add method one time' do
      new_contact = Contact.new("bob", '555 555-5555', 'bob@bob.com', '123 5th Ave, Portland, Oregon')
      new_contact.add
      Contact.all.should eq [new_contact]
    end
  end

  describe '.create' do
    it 'creates an intialized Contact instance' do
      new_contact = Contact.create("bob", '555 555-5555', 'bob@bob.com', '123 5th Ave, Portland, Oregon')
      new_contact.email.should eq "bob@bob.com"
      new_contact.phone.should eq "555 555-5555"
      new_contact.address.should eq "123 5th Ave, Portland, Oregon"
    end
  end

  describe '.view_contact' do
    it 'views all information of a chosen contact' do
      first_contact = Contact.create("bert", '555 555-5555', 'bob@bob.com', '123 5th Ave, Portland, Oregon')
      second_contact = Contact.create("ernie", '555 123-4567', 'bob@bob.com', '123 6th Ave, Eugene, Oregon')
      Contact.view_contact('ernie').should eq second_contact
    end
  end
end
