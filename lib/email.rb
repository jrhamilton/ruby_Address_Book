class Email

  def initialize(email)
    @email = email
    @all_emails = []
  end

  def Email.all
    @all_emails
  end

  def add(email)
    @all_emails << email
  end

  def Email.create(email)
    new_email = Email.new(email)
    if email != ""
      new_email.add(email)
    end
    new_email
  end

  def email
    @email
  end

  def edit_email(email)
    @email = email
  end
end
