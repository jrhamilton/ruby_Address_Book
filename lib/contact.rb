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

  def initialize(name, phone, email, address)
    @phones = []
    @emails = []
    @addresses = []
    @name = name

    @phones << Phone.create(phone)
    @emails << Email.create(email)
    @addresses << Address.create(address)
  end

  def name
    @name
  end

  def phones
    @phones
  end

  def emails
    @emails
  end

  def addresss
    @addresses
  end

  def add_phone(phone)
    @phones << Phone.create(phone)
  end

  def add_email(email)
    @emails << Email.create(email)
  end

  def add_address(address)
    @addresses << Address.create(address)
  end

  def phone(index)
    @phones[index].number
  end

  def email(index)
    @emails[index].email
  end

  def address(index)
    @addresses[index].address
  end

  def add
    @@all_contacts << self
  end

  def edit_name(name)
    @name = name
  end
end



  # def Contact.view_contact(contact)  #Doesn't work right
  #   @@all_contacts.each do |cont|
  #     if contact.name == cont.name
  #       return contact
  #     end
  #     contact.name
  #   end

  # end

  # def Contact.edit(contact, choice, new_edit)
  #   @@all_contacts.each do |cont|
  #     if contact.name == cont.name
  #       puts "name #{contact.name}"
  #       puts "choice #{choice}"
  #       puts "new_edit #{new_edit}"
  #       case choice
  #       when "name"
  #         .name = new_edit
  #       when "phone"
  #         contact.phone.number = new_edit
  #       when "email"
  #         contact.email.email = new_edit
  #       when "address"
  #         contact.address.address = new_edit
  #       else
  #         puts "Bad Input. Try Again"
  #       end

  #     end
  #   end
  # end

