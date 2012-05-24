################################################
# model admin_users
# daniel glenn <glenn@starwolf.ch>
#
# authenticate setzen - password behanden in der app
#
# 05.06.2011 init
# 12.06.2011 relation angepasst - fehler belongs_to  => has_and_belongs_to_many
# ersetzt
# 19.06.2011 validates eingebaut und methode name
# 10.07.2011 nochmals angeschaut und formatierung angepasst wegen neuer version
# von gmate
################################################

require 'digest/sha1' # einbinden hash methode sha1 512bit
class AdminUser < ActiveRecord::Base
  # user relation to pages ID
  has_and_belongs_to_many :pages
  # user relation to sections ID
  has_many :section_edits
  has_many :sections, :through => :section_edits
  # accessor für password - einschränkung
  attr_accessor :password
  # mail regular expression => rubyonrails.org search
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  # validations für eingabe felder => db => migration
  validates :first_name, :presence => true, :length => { :maximum => 25 }
  validates :last_name, :presence => true, :length => { :maximum => 50 }
  validates :username, :length => { :within => 8..25 }, :uniqueness => true
  # regular expression einsetzten für email validate
  validates :email, :presence => true, :length => { :maximum => 100 },
    :format => EMAIL_REGEX, :confirmation => true
  validates_length_of :password, :within => 8..25, :on => :create
  # constrains zum password
  before_save :create_hashed_password
  after_save :clear_password

  scope :named, lambda {|first,last| where(:first_name => first, :last_name => last)}
  scope :sorted, order("admin_users.last_name ASC, admin_users.first_name ASC")

  attr_protected :hashed_password, :salt

 # methode name
 # info zusammensetzen vor und nachname
  def name
    "#{first_name} #{last_name}"
  end

  # methode authenticate
  # param  username => as cleartext oder nil
  # param password  => as cleartext oder nil
  # return value => true => user ist i.o sonst false
  def self.authenticate(username="", password="")
    # select * from users where username = username
    user = AdminUser.find_by_username(username)
    if user && user.password_match?(password)
      return user
    else
      return false
    end
  end

  # methode hash_with_salt
  # param password => as cleartext
  # param salt
  def self.hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end

  # methode password_match
  # param password => as cleartext oder nil
  # info salt und password mit der gleichen hash methode ergeben hash-pw
  def password_match?(password="")
    # methode hash_with_salt ausführen
    hashed_password == AdminUser.hash_with_salt(password, salt)
  end

  # methode make_salt
  # param username => as cleartext
  def self.make_salt(username="")
    Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
  end

  private

  # private methode clear_password
  # info pw zurücksetzen auf null
  def clear_password
    self.password = nil
  end
  # private methode create_hashed_password
  # info pw ist nicht null dann hashing
  def create_hashed_password
    unless password.blank? # wenn nicht null
      self.salt = AdminUser.make_salt(username) if salt.blank?
      self.hashed_password = AdminUser.hash_with_salt(password, salt)
    end
  end
end #end of class

