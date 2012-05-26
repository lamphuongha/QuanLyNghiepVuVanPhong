module CongvansHelper
  def options_from_collection_for_select_with_nil(collection, value_method, text_method, selected = nil)
    op=options_from_collection_for_select(collection, value_method, text_method, selected)
    op = '<option value="">Tất cả</option>'+op
    return op
  end
  # File actionpack/lib/action_view/helpers/date_helper.rb, line 381
   def select_date(date = Date.current, options = {}, html_options = {})
        DateTimeSelector.new(date, options, html_options).select_date
  end
end
