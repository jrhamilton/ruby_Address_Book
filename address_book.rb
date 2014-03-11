# UI
require './lib/contact'
require './lib/phone'
require './lib/email'
require './lib/address'


def main_menu
  puts "\nType 'add' to add a contact to the book or 'show' to view all of your contacts"
  choice = gets.chomp
  case choice
    when "add"
      add_contact
    when "show"
      main_address_book
  else
    puts "Invalid input\n\n"
    main_menu
  end
end

def main_address_book
  puts "Your Address Book"
  display_names_to_edit
  puts "Type 'add' to add a contact to the book or 'edit' to edit a contact"
  choice = gets.chomp
  case choice
    when "add"
      add_contact_menu
    when "edit"
      edit_contact_menu
  else
    puts "Invalid input\n\n"
    main_address_book
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
    puts "#{index}: #{contact.name}\n"
  end
  contact_index = gets.chomp
  do_edit_contact(contacts[contact_index])
end

def do_edit_contact(contact)
  Contact.view_contact(contact)
  puts "Choose 'name' to edit Name, 'phone' to edit Phone, 'email' to edit Email, 'address' to edit Address or 'x' to go back to main menu"
  choice = gets.chomp
  edit_contact_field(contact, choice)
end

def edit_contact_field(contact, choice)
  puts "Enter your new " + choice
  new_edit = gets.chomp
  Contact.edit(contact.name, choice, new_edit)
end

main_menu
