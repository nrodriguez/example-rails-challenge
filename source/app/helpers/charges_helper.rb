module ChargesHelper

  def formatted_amount(amount)
    number_to_currency(amount/100)
  end
end
