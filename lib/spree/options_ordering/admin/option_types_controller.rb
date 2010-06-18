module Spree::OptionsOrdering::Admin::OptionTypesController

  def self.included(target)
    target.class_eval do
      def reorder_option_type_option_values; site_reorder_option_type_option_values; end
    end
  end

  private

  # Reorder the option values for the selected option type
  def site_reorder_option_type_option_values
    option_type = OptionType.find(params[:id])
    option_type.option_values.each do |option_value|
      option_value.update_attribute(:position, params['option_value'].index(option_value.id.to_s) + 1)
    end
    render :nothing => true
  end

end
