# UI
require './lib/contact'
require './lib/phone'
require './lib/email'
require './lib/address'


def main_menu
  puts "Your Address Book"
  contacts = Contact.all
  contacts.each do |contact|
    puts "#{contact.name}\t#{contact.phone.number}\t#{contact.email.email}\t#{contact.address.address}\n"
  end
  puts "\n"
  puts "Type 'add' to add a contact to the book or 'edit' to edit a contact"
  choice = gets.chomp
  case choice
    when "add"
      add_contact_menu
    when "edit"
      edit_contact_menu
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
  puts "#{contact.name}\t#{contact.phone.number}\t#{contact.email.email}\t#{contact.address.address}\n"
  puts "Choose 'add' if you would like to add details, or 'edit' if you want to edit your contact."
  choice2 = gets.chomp
  case choice2
    when "add"
      add_detail(contact)
    when "edit"
      puts "Choose 'name' to edit Name, 'phone' to add or edit Phone, 'email' to add or edit Email, 'address' to add or edit Address or 'x' to go back to main menu"
      choice = gets.chomp
      if choice = "x"
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
  new_edit = gets.chomp
  case choice
    when "name"
      contact.edit_name(new_edit)
      puts "contact name updated"
      main_menu
    when "phone"
      contact.phone.edit_number(new_edit)
      puts "contact phone number updated"
      main_menu
    when "email"
      contact.email.edit_email(new_edit)
      puts "contact email updated"
      main_menu
    when "address"
      contact.address.edit_address(new_edit)
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
      contact.phone.add(new_edit)
      puts "contact phone number added"
      main_menu
    when "email"
      contact.email.add(new_edit)
      puts "contact email added"
      main_menu
    when "address"
      contact.address.add(new_edit)
      puts "contact address added"
      main_menu
    when "x"
      main_menu
  else
    puts "Bad Input. Try Again"
  end
end

main_menu
