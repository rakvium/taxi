module OrdersHelper
  def status_string(status)
    case status
    when 0
      'Cвободен'
    when 1
      'Назнчен заказ'
    when 2
      'Едет к клиенту'
    when 3
      'Встретился с клиентом'
    when 4
      'Не активен'
    end
  end
end
