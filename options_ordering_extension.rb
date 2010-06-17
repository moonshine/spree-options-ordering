# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class OptionsOrderingExtension < Spree::Extension
  version "1.0"
  description "Adds ordering of product option values to the admin interface"
  url "http://yourwebsite.com/options_ordering"

  # Please use options_ordering/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate
    # Override spree admin option types controller
    Admin::OptionTypesController.send(:include, Spree::OptionsOrdering::Admin::OptionTypesController)

  end
end
