module ApplicationHelper
  def convert_to_jpy(price)
    "¥#{price.to_s(:delimited, delimiter: ',')}"
  end
end
