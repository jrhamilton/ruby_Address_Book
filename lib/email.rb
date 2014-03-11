class Email
  @@all_emails = []

  def initialize(email)
    @email = email
  end

  def Email.all
    @@all_emails
  end

  def add
    @@all_emails << self
  end

  def Email.create(email)
    new_email = Email.new(email)
    new_email.add
    new_email
  end

  def email
    @email
  end
end
