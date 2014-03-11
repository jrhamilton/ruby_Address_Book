class Contact
  @@all_contacts = []

  def Contact.create(name, phone, email, address)
    contact = Contact.new(name, phone, email, address)
    contact.add
    contact
  end

  def Contact.all
    @@all_contacts
  end

  def Contact.view_contact(name)
    @@all_contacts.each do |contact|
      if contact.name == name
        return contact
      end
    end
    puts "No contact found"
  end

  def Contact.edit(name, choice, new_edit)
    @@all_contacts.each do |contact|
      if contact.name == name
        contact.choice.to_sym = new_edit
      end
    end
  end

  def initialize(name, phone, email, address)
    @name = name
    @phone = phone
    @email = email
    @address = address
  end

  def name
    @name
  end

  def phone
    @phone
  end

  def email
    @email
  end

  def address
    @address
  end

  def add
    @@all_contacts << self
  end
end
