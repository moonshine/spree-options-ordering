$(function() {
  // Function will allow user to reorder option values for an option type
  $('#option_values').sortable(
    {
      axis: 'y',
      dropOnEmpty:false,
      cursor: 'crosshair',
      items: 'tr',
      opacity: 0.4,
      scroll: true,
      update: function(){
        $.ajax({
            type: 'post',
            data: $('#option_values').sortable('serialize') + '&id=<%=@option_type.id-%>',
            dataType: 'script',
            complete: function(request){
                $('#option_values').effect('highlight');
              },
            url: '/admin/option_types/reorder_values'})
        }
      })
})