class OptionsOrderingHooks < Spree::ThemeSupport::HookListener

  insert_after :admin_inside_head do
    "<%= javascript_include_tag 'jquery-ui-1.7.3.custom.min' %>"
  end
  insert_after :admin_option_type_edit_form, 'admin/option_types/options_ordering_form'

end
