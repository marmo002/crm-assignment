gem "activerecord", "=4.2.10"
require "active_record"
require "mini_record"

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact

  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note

    @id = @@id
    @@id += 1
  end

  # READERS
  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def email
    @email
  end

  def note
    @note
  end

  def id
    @id
  end

  # WRITTERS
  def first_name=(first_name)
    @first_name = first_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def email=(email)
    @email = email
  end

  def note=(note)
    @note = note
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.select do |contact|
      contact.id == id
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, value)
    if attribute == "first name"
      self.first_name = value
    elsif attribute == "last name"
      self.last_name = value
    elsif attribute == "email"
      self.email = value
    elsif attribute == "notes"
      self.note = value
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by
    puts "How do you wanna find your contact (First name, Last name, email ,or notes)"
    user_input = gets.chomp

    if user_input == "first name"
      puts "What's the name of your contact"
      contact_name = gets.chomp
      results = @@contacts.select do |contact|
        contact.first_name == contact_name
      end
      p results[0]
    elsif user_input == "last name"
      puts "What's the Last name of your contact"
      contact_lastname = gets.chomp
      p results = @@contacts.select do |contact|
        contact.last_name == contact_lastname
      end
      p results[0]
    elsif user_input == "email"
      puts "What's your contact's email"
      contact_email = gets.chomp
      p results = @@contacts.select do |contact|
        contact.email == contact_email
      end
      p results[0]
    elsif user_input == "notes"
      puts "Type your contact's exact notes"
      contact_note = gets.chomp
      p results = @@contacts.select do |contact|
        contact.note == contact_note
      end
      p results[0]
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    puts "Are you sure you want to delete \"#{full_name}\" as a contact?"
    user_input = gets.chomp
    if user_input == "yes"
      puts "#{full_name} has been deleted"
      @@contacts.delete(self)
    end
  end

  # Feel free to add other methods here, if you need them.

end


# contact1 = Contact.create('Betty', 'Maker', 'bettymakes@gmail.com', 'Loves Pokemon')
# contact2 = Contact.create('Alfonso', 'Rubel', 'alnfonso@mail.com', 'cooks a lot')
# contact3 = Contact.create('Mauricio', 'Nadal', 'nadal@mail.com', 'plays soccer')
# contact4 = Contact.create('Meliza', 'Pineda', 'meliza@mail.com', 'cleans a lot')
