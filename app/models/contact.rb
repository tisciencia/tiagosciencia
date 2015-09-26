class Contact
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  validates :name,
            :length => {:in => 1..50}

  validates :email,
            :format => { :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }

  validates :message,
            :length => {:in => 1..750}

  attr_accessor :name, :message, :email

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end