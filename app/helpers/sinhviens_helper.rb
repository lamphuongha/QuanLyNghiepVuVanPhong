module SinhviensHelper
  def options_from_collection_for_select_with_nil(collection, value_method, text_method, selected = nil)
    op=options_from_collection_for_select(collection, value_method, text_method, selected)
    op = '<option value="">Tất cả</option>'+op
    return op
  end
end
