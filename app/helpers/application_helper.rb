module ApplicationHelper
  def calc_rate(min_diff, max_diff)
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
end
