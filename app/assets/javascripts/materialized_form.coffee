global = this

global.load_begin = (which) ->
  $(".#{which} .progress").fadeIn()

global.load_done = (which) ->
  $(".#{which} .progress").fadeOut()

global.formalize_and_open = ->
  $('#form').modal()
  base_conf = {
    container: '.main'
    selectMonths: true
    selectYears: 8
    format: 'yyyy-mm-dd'
    formatSubmit: 'yyyy-mm-dd'
    today: 'Today'
    clear: 'Clear'
    close: 'Ok'
    closeOnSelect: false
    onSet: undefined
  }

  $('.datepicker').pickadate
    container: '.main'
    selectMonths: true
    selectYears: 8
    format: 'yyyy-mm-dd'
    formatSubmit: 'yyyy-mm-dd'
    today: 'Today'
    clear: 'Clear'
    close: 'Ok'
    closeOnSelect: true

  $('.timepicker').pickatime
    container: '.main'
    default: 'now'
    format: 'HH:ii'
    formatSubmit: 'HH:ii'
    twelvehour: false
    donetext: 'OK'
    cleartext: 'Clear'
    canceltext: 'Cancel'
    autoclose: true
    ampmclickable: true

  $('select').material_select()
  $('#form').modal 'open'
