$('#loader-bg').fadeIn()
$('#form').html "<%= j( render( 'form', event: @event ) )%>"
formalize()
