class MyTradeShipProfitObject
  attr_accessor :view_context, :show_profit

  def initialize(view_context, show_profit: )
    self.view_context = view_context
    self.show_profit = show_profit
  end

  def table_first_header
    view_context.content_tag('th', colspan: (show_profit ? 3 : 2)) do
      if !show_profit
        view_context.link_to('show profit', '#', data: { 'option-column': 'show' })
      end
    end
  end

  def table_middle_header
    if @show_profit
      view_context.content_tag('th')
    else
      view_context.content_tag('th', data: { 'option-column': 'profit' }) {  }
    end
  end

  def table_body
    if @show_profit
      return view_context.content_tag('td') { yield }
    else
      return view_context.content_tag('td', data: { 'option-column': 'profit' }) { yield }
    end
  end
end
