# load_begin("<%= params[:controller] %>")
<% if @task.nil? %>
  <% @task = Task.new %>
<% end %>
$('.fixed-action-btn').closeFAB()
$('#form').html "<%= j( render( 'form', task: @task ) )%>"
formalize_and_open()
# load_done("<%= params[:controller] %>")

# TODO: make awesome preloader
