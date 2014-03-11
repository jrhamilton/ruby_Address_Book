class Phone
  @@all_phones = []

  def Phone.create(number)
    new_phone = Phone.new(number)
    new_phone.add
    new_phone
  end

  def initialize(number)
    @number = number
  end

  def Phone.all
    @@all_phones
  end

  def add
    @@all_phones << self
  end

  def number
    @number
  end
end
