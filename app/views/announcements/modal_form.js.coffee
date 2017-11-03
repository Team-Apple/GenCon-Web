# load_begin("<%= params[:controller] %>")
<% if @announcement.nil? %>
  <% @announcement = Announcement.new %>
<% end %>
$('#form').html "<%= j( render( 'form', announcement: @announcement ) )%>"
formalize_and_open()
