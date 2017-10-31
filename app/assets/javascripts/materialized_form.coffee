global = this

global.formalize = ->
  $('#form').modal()
  $('.datepicker').pickadate
    selectMonths: true
    selectYears: 8
    format: 'yyyy-mm-dd'
    formatSubmit: 'yyyy-mm-dd'
    today: 'Today'
    clear: 'Clear'
    close: 'Ok'
    closeOnSelect: false

  $('.timepicker').pickatime
    default: 'now'
    format: 'HH:ii'
    formatSubmit: 'HH:ii'
    twelvehour: false
    donetext: 'OK'
    cleartext: 'Clear'
    canceltext: 'Cancel'
    autoclose: false
    ampmclickable: true

  $('#form').modal 'open'
  $('select').material_select()
  modalW = $('.modal').width()
