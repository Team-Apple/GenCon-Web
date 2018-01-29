# load_begin("<%= params[:controller] %>")
<% if @event.nil? %>
  <% @event = Event.new %>
<% end %>
$('.fixed-action-btn').closeFAB()
$('#form').html "<%= j( render( 'form', event: @event ) )%>"
formalize_and_open()
# load_done("<%= params[:controller] %>")

# TODO: make awesome preloader
