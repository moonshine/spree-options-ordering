class OptionsOrderingHooks < Spree::ThemeSupport::HookListener

  insert_after :admin_inside_head, 'admin/shared/scripts'

end
