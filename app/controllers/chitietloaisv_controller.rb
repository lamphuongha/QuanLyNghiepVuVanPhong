class ChitietloaisvController < ApplicationController
 def grouped_collection_select(object, method, collection, group_method, group_label_method, option_key_method, option_value_method, options = {}, html_options = {})
  InstanceTag.new(object, method, self, options.delete(:object)).to_grouped_collection_select_tag(collection, group_method, group_label_method, option_key_method, option_value_method, options, html_options)
end
end
