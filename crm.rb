require './contact.rb'

class CRM

  def initialize(name = "CRM")
    puts "Okay, this CRM has the name " + name
  end

  def main_menu

    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
    
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then exit # abort("Bye") How to exit a Ruby program
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact

    puts "Contact id please"
    id = gets.to_i

    puts "What do you wanna update?"
    attribute = gets.chomp

    puts "Whats the new #{attribute}"
    value = gets.chomp

    contact = Contact.find(id).first

    contact.update(attribute, value)

  end

  def delete_contact

    print "Provide contact ID please"
    id = gets.to_i

  end

  def display_all_contacts

    p Contact.all.inspect

  end

  def search_by_attribute

    Contact.find_by

  end


end

contact1 = Contact.create('Betty', 'Maker', 'bettymakes@gmail.com', 'Loves Pokemon')
contact2 = Contact.create('Alfonso', 'Rubel', 'alnfonso@mail.com', 'cooks a lot')
contact3 = Contact.create('Mauricio', 'Nadal', 'nadal@mail.com', 'plays soccer')
contact4 = Contact.create('Meliza', 'Pineda', 'meliza@mail.com', 'cleans a lot')

uno = CRM.new

uno.main_menu
