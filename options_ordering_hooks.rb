class OptionsOrderingHooks < Spree::ThemeSupport::HookListener

  insert_after :admin_inside_head, 'admin/shared/scripts'
  insert_after :admin_option_type_edit_form, 'admin/option_types/options_ordering_form'

end
