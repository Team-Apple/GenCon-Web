$('#loader-bg').fadeIn()
<% if @event.nil? %>
  <% @event = Event.new %>
<% end %>
$('#form').html "<%= j( render( 'form', event: @event ) )%>"
formalize()
