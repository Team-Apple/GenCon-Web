# load_begin("<%= params[:controller] %>")
<% if @announcement.nil? %>
  <% @announcement = Announcement.new %>
<% end %>
$('.fixed-action-btn').closeFAB()
$('#form').html "<%= j( render( 'form', announcement: @announcement ) )%>"
formalize_and_open()
