$ ->
  current_days = ->
    days = []
    for elem in $('th.fc-day-header')
      days.push $(elem).data('date')
    days

  renderShifts = ->
    events = $('#calendar').data('events')
    days = current_days()
    for event,idx in events
      $('#calendar').fullCalendar('renderEvent', {
        start: "#{days[idx]}T#{event.start}",
        end: "#{days[idx]}T#{event.end}"
      })

  $('#calendar').fullCalendar({
    themeSystem: 'bootstrap3',
    defaultView: 'agendaWeek',
    header: {
      left: '',
      right: 'title prev,next today'
    },
    height: 'auto',
    slotLabelFormat:"HH:mm"
    timeFormat: 'HH:mm',
    allDaySlot: false,
    minTime: '09:00:00',
    maxTime: '19:00:00',
    viewRender: renderShifts
  })
