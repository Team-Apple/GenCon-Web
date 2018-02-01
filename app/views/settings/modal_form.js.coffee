# load_begin("<%= params[:controller] %>")
$('#form').html "<%= j( render( 'form', setting: @setting ) )%>"
formalize_and_open()
# load_done("<%= params[:controller] %>")
# TODO: make awesome preloader
