# Options Ordering

This Spree extension adds the ability to re-order product option values for a particular option type.
For example if we had an option type called "Color" with the following option values:

Red

Blue

White

This extenstion adds the ability to change the order of these values by simply dragging
and dropping the item into the desired position. A new icon has been added to the option
type edit form that allows the user to select the record and drag it.

# Important Note

This extension depends on a patched version of the following Spree view:

vendor/extensions/theme_default/app/views/admin/option_types/_form.html.erb

    <% hook :admin_option_type_edit_form do %>
      <%- locals = {:f => f} -%>
      <% hook :admin_option_type_edit_fields, locals do %>
        <% f.field_container :name do %>
          <%= f.label :name, t("name") %><br />
          <%= f.text_field :name %>
          <%= f.error_message_on :name %>
        <% end %>

        <% f.field_container :name do %>
          <%= f.label :presentation, t("presentation") %><br />
          <%= f.text_field :presentation %>
          <%= f.error_message_on :presentation %>
        <% end %>
      <% end %>

      <% hook :admin_option_type_edit_option_values, locals do %>
        <h3><%= t("option_values") %></h3>
        <table class="index">
          <thead>
            <tr>
              <th><%= t("name") %></th>
              <th><%= t("display") %></th>
              <th></th>
            </tr>
          </thead>
          <tbody id="option_values">
            <%= f.render_associated_form(@option_type.option_values) %>
            <tr id="none">
              <td colspan="3"><%= @option_type.option_values.empty? ? t("none") : "" %></td>
            </tr>
          </tbody>
        </table>
      <% end %>

      <% hook :admin_option_type_edit_buttons, locals do %>
        <p>
        <%= f.add_associated_link( icon('add') + ' ' + t("add_option_value"), @option_type.option_values.build,
                               {:onclick => "jQuery('#none').hide();", :class => 'iconlink'}) %>
        </p>
      <% end %>

    <% end %>
