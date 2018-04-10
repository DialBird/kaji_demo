$ ->
  $('#calendar').fullCalendar({
    defaultView: 'agendaWeek',
    themeSystem: 'bootstrap3',
    height: 'auto',
    header: {
      left: '',
      right: 'title prev,next today'
    },
    minTime: '09:00:00',
    maxTime: '19:00:00'
  })
