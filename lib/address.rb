class Address

  def initialize(address)
    @address = address
    #@all_addresses = []
  end

  def Address.create(address)
    new_address = Address.new(address)
    # if address != ""
    #   new_address.add(address)
    # end
    new_address
  end

  # def add(address)
  #   @all_addresses << address
  # end

  # def Address.all
  #   @all_addresses
  # end

  def address
    @address
  end

  def edit_address(address)
    @address = address
  end
end
