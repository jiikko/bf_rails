module ApplicationHelper
  def calc_rate(min_diff, max_diff)
    if (min_diff.nil? || max_diff.nil?)
      return 0
    end
    if min_diff.zero? || max_diff.zero?
      return 0
    end

    if min_diff < 0
      min_diff = 0
    end
    if max_diff < 0
      max_diff = 0
    end
    rate = (min_diff / max_diff.to_f)
    if rate > 1
      rate = 1
    end
    if rate < 0
      rate = 0
    end
    (rate * 100).to_i
  end

  def health_meter(status)
    max = 4
    result = []
    status_health = BF::Monitor.state_const_with_number[status['health']]
    return if status_health.nil?
    halth_number = status_health - 1
    if halth_number.nil?
      return
    end
    busy_number = max - halth_number
    halth_number.times do
      result << content_tag(:div, nil, style: 'float: left; width: 10px; height: 20px; margin-right: 5px; background-color: green;')
    end
    busy_number.times do
      result << content_tag(:div, nil, style: 'float: left; width: 10px; height: 20px; margin-right: 5px; background-color: red;')
    end
    result << content_tag(:div, nil, style: 'clear: both')
    result.join.html_safe
  end

  def css_class_of_trade_ship_status(my_trade_ship)
    case
    when my_trade_ship.running?
      :waiting
    when my_trade_ship.canceled?
      :canceled
    else
      :succeed
    end
  end
end
