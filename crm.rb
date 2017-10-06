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

    # Contact.create(first_name, last_name, email, note)
    contact = Contact.create(
    first_name:   first_name,
    last_name:    last_name,
    email:        email,
    note:         note
    )
  end

  def modify_existing_contact

    puts "Contact id please"
    id = gets.to_i

    puts "What do you wanna update?"
    attribute = gets.chomp

    puts "Whats the new #{attribute}"
    value = gets.chomp

    contact = Contact.find(id)

    contact.update_attribute(attribute, value)

  end

  def delete_contact

    print "Provide contact ID please"
    id = gets.to_i
    contact = Contact.find(id)
    p contact.delete
  end

  def display_all_contacts

    p Contact.all

  end

  def search_by_attribute
    puts 'How do you wanna find your contact'
    puts '[1] By First name'
    puts '[2] By Last name'
    puts '[3] By email'
    puts '[4] By notes'
    puts '[5] By ID'
    puts 'Enter a number: '
    user_selected = gets.to_i

    case user_selected
      when 1 then by_first_name
      when 2 then by_last_name
      when 3 then by_email
      when 4 then by_notes
      when 5 then by_id
    end
  end

  def by_first_name
    puts "What's your contact's First Name"
    user_input = gets.chomp
    p Contact.find_by first_name: user_input
  end

  def by_last_name
    puts "What's your contact's Last Name"
    user_input = gets.chomp
    p Contact.find_by last_name: user_input
  end

  def by_email
    puts "What's your contact's email"
    user_input = gets.chomp
    p Contact.find_by email: user_input
  end

  def by_notes
    puts "What's your contact's notes"
    user_input = gets.chomp
    p Contact.find_by note: user_input
  end

  def by_id
    puts "What's your contact's ID number"
    user_input = gets.to_i
    p Contact.find(user_input)
  end
end

at_exit do
  ActiveRecord::Base.connection.close
end
