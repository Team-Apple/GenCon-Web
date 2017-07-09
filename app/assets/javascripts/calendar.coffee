global = this
global.changeTitleDate = ->
  date = $('#calendar').fullCalendar 'getDate'
  console.log date
  $('#cal-title').empty()
  if $('#calendar').fullCalendar('getView').name is 'agendaWeek'
    $('#cal-title').append date.format('YYYY  M/D') + ' - ' + date.add(6, 'days').format('D')
  else
    $('#cal-title').append date.format('YYYY MMMM')

global.openModal = ->
  $('select').material_select()
  modalW = $('.modal').width()
  $('.datetime_select .select-wrapper').css
    'display': 'inline-block'
    'width': (modalW / 10) + 'px'

  $('#form').modal
    inDuration: 100
    outDuration: 100
  $('#form').modal 'open'

global.calPrev = ->
  $('#calendar').fullCalendar 'prev'
  changeTitleDate()

global.calNext = ->
  $('#calendar').fullCalendar 'next'
  changeTitleDate()

global.calToday = ->
  $('#calendar').fullCalendar 'today'
  changeTitleDate()

global.switchView = ->
  if $('#calendar').fullCalendar('getView').name is 'agendaWeek'
    $('#calendar').fullCalendar 'changeView', 'month'
    $('#view-icon').text 'view_week'
  else
    $('#calendar').fullCalendar 'changeView', 'agendaWeek'
    $('#view-icon').text 'view_comfy'
  changeTitleDate()

$(document).ready ->
  $('#calendar').fullCalendar
    slotLabelFormat: 'H:mm'
    columnFormat: 'M/D （ddd）'
    defaultView: 'agendaWeek'
    nowIndicator: true
    editable: false
    selectable: true
    selectHelper: true
    unselectAuto: true
    unselectCancel: '#form'
    height: 760
    minTime: '06:00:00'
    maxTime: '23:00:00'
    header: false
    allDayText: '全日'
    views:
      agenda:
        timeFormat: 'H:mm'

    loading: (isLoading) ->
      if isLoading
        $('#loader-bg').fadeIn 'fast'
      else
        $('#loader-bg').fadeOut 'fast'

    selectAllow: (info) ->
      if info.start <= moment()
        return false
      else return true

    select: (start, end, jsEvent) ->
      openModal()

    monthNames: [
      '1月'
      '2月'
      '3月'
      '4月'
      '5月'
      '6月'
      '7月'
      '8月'
      '9月'
      '10月'
      '11月'
      '12月'
    ]

    monthNamesShort: [
      '1月'
      '2月'
      '3月'
      '4月'
      '5月'
      '6月'
      '7月'
      '8月'
      '9月'
      '10月'
      '11月'
      '12月'
    ]

    dayNames: [
      '日曜日'
      '月曜日'
      '火曜日'
      '水曜日'
      '木曜日'
      '金曜日'
      '土曜日'
    ]

    dayNamesShort: [
      '日'
      '月'
      '火'
      '水'
      '木'
      '金'
      '土'
    ]
    
  changeTitleDate()

window.onunload = ->
  location.reload()
  return

window.onbeforeunload = ->
  location.reload()
  return
