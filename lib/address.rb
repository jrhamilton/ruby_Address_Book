class Address
  @@all_addresses = []

  def initialize(address)
    @address = address
  end

  def Address.create(address)
    new_address = Address.new(address)
    new_address.add
    new_address
  end

  def add
    @@all_addresses << self
  end

  def Address.all
    @@all_addresses
  end

  def address
    @address
  end
end
