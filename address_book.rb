# UI
require './lib/contact'
require './lib/phone'
require './lib/email'
require './lib/address'


def main_menu
  puts "Your Address Book"
  contacts = Contact.all
  contacts.each do |contact|
    puts "#{contact.name.capitalize}\n"
    contact.phones.each do |phone|
      puts "#{phone.number}\n"
    end
    contact.emails.each do |em|
      puts "#{em.email}\n"
    end
    contact.addresses.each do |addr|
      puts "#{addr.address}\n"
    end
  end
  puts "\n"
  puts "Type 'add' to add a contact to the book, 'edit' to edit a contact, or 'x' to exit"
  choice = gets.chomp
  case choice
    when "add"
      add_contact_menu
    when "edit"
      edit_contact_menu
    when "x"
      puts "Thanks for using Address Book."
  else
    puts "Invalid input\n\n"
    main_menu
  end
end

def add_contact_menu
  puts "Type your contact name"
  name = gets.chomp
  puts "Type your contact phone number"
  phone = gets.chomp
  puts "Type your contact email"
  email = gets.chomp
  puts "Type your contact address"
  address = gets.chomp
  new_contact = Contact.create(name, phone, email, address)
  puts "Contact added.\n\n"
  main_menu
end

def edit_contact_menu
  puts "Choose a contact to edit"
  contacts = Contact.all
  contacts.each_with_index do |contact, index|
    puts "#{index + 1}: #{contact.name}\n"
  end
  contact_index = gets.chomp.to_i
  do_edit_contact(contacts[contact_index - 1])
end

def do_edit_contact(contact)
  puts "#{contact.name.capitalize}\n"
  contact.phones.each do |phone|
    puts "#{phone.number}\n"
  end
  contact.emails.each do |em|
    puts "#{em.email}\n"
  end
  contact.addresses.each do |addr|
    puts "#{addr.address}\n"
  end
  puts "Choose 'add' if you would like to add details, or 'edit' if you want to edit your contact."
  choice2 = gets.chomp
  case choice2
    when "add"
      add_detail(contact)
    when "edit"
      puts "Choose 'name' to edit Name, 'phone' to add or edit Phone, 'email' to add or edit Email, 'address' to add or edit Address or 'x' to go back to main menu"
      choice = gets.chomp
      if choice == "x"
        main_menu
      end
      edit_contact_field(contact, choice)
  else
    puts "Invalid entry. Try again."
    do_edit_contact(contact)
  end
end

def edit_contact_field(contact, choice)
  puts "Enter your new " + choice
  case choice
    when "name"
      puts "Enter new name"
      new_edit = gets.chomp
      contact.edit_name(new_edit)
      puts "contact name updated"
      main_menu
    when "phone"
      puts "Choose the index value of the phone number you want to edit"
      contact.phones.each_with_index do |phone, index|
        puts "#{index + 1}: #{contact.phone(index)}\n"
      end
      index_input = gets.chomp.to_i
      puts "Enter your edited phone number"
      new_edit = gets.chomp
      contact.phones[index_input - 1].edit_number(new_edit)
      puts "contact phone number updated"
      main_menu
    when "email"
      puts "Choose the index value of the email address you want to edit"
      contact.emails.each_with_index do |email, index|
        puts "#{index + 1}: #{contact.email(index)}\n"
      end
      index_input = gets.chomp.to_i
      puts "Enter your edited email"
      new_edit = gets.chomp
      contact.emails[index_input - 1].edit_email(new_edit)
      puts "contact Email Address updated"
      main_menu
    when "address"
      puts "Choose the index value of the address you want to edit"
      contact.addresses.each_with_index do |address, index|
        puts "#{index + 1}: #{contact.address(index)}\n"
      end
      index_input = gets.chomp.to_i
      puts "Enter your edited address"
      new_edit = gets.chomp
      contact.addresses[index_input - 1].edit_address(new_edit)
      puts "contact address updated"
      main_menu
  else
    puts "Bad Input. Try Again"
    do_edit_contact(contact)
  end
end

def add_detail(contact)
  puts "Choose 'phone' to add Phone, 'email' to add Email, 'address' to add Address or 'x' to go back to main menu"
  choice = gets.chomp
  puts "Enter your new " + choice
  new_edit = gets.chomp
  case choice
    when "phone"
      contact.add_phone(new_edit)
      puts "contact phone number added"
      main_menu
    when "email"
      contact.add_email(new_edit)
      puts "contact email added"
      main_menu
    when "address"
      contact.add_address(new_edit)
      puts "contact address added"
      main_menu
    when "x"
      main_menu
  else
    puts "Bad Input. Try Again"
  end
end

main_menu
