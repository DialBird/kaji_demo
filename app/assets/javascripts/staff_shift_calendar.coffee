$ ->
  current_days = ->
    days = []
    for elem in $('th.fc-day-header')
      days.push $(elem).data('date')
    days

  renderIrregularOffs = ->
    events = $('#calendar').data('offs')
    for event in events
      date = event.date
      $('#calendar').fullCalendar('renderEvent', {
        title: 'off',
        start: "#{date}T#{event.start}",
        end: "#{date}T#{event.end}",
        color: '#333'
      })

  renderShifts = ->
    events = $('#calendar').data('shifts')
    days = current_days()
    for event,idx in events
      $('#calendar').fullCalendar('renderEvent', {
        start: "#{days[idx]}T#{event.start}",
        end: "#{days[idx]}T#{event.end}",
        rendering: 'background',
        color: '#90ee90'
      })

  viewRender = ->
    renderIrregularOffs()
    renderShifts()

  $('#calendar').fullCalendar({
    themeSystem: 'bootstrap3',
    defaultView: 'agendaWeek',
    slotEventOverlap: false,
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
    viewRender: viewRender
  })
