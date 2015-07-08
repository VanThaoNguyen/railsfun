module ProductsHelper
  def format_money(money)
    number_to_currency( money, separator: ".", delimiter: "_", format: "%n")
  end
end
