# Add action site_reorder_values to reorder the option values for an option type
map.namespace :admin do |admin|
  admin.resources :products, :member => {:clone => :get}, :has_many => [:product_properties, :images] do |product|
    product.resources :option_types, :member => { :select => :get, :remove => :get}, :collection => {:available => :get, :selected => :get, :site_reorder_values => :post}
  end
end
