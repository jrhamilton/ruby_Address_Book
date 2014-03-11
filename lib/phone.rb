class Phone

  def Phone.create(number)
    new_phone = Phone.new(number)
    # if number != ""
    #   new_phone.add(number)
    # end
    new_phone
  end

  def initialize(number)
    @number = number
    #@all_phones = []
  end

  # def Phone.all
  #   @all_phones
  # end

  # def add(number)
  #   @all_phones << number
  # end

  def number
    @number
  end

  def edit_number(new_number)
    @number = new_number
  end
end
