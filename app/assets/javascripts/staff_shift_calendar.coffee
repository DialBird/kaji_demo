$ ->
  current_days = ->
    days = []
    for elem in $('th.fc-day-header')
      days.push $(elem).data('date')
    days

  #
  # Ajax success
  #

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

  eventColor = (type) ->
    if type == 'CleanOrder'
      '#0ff'
    else
      '#333'

  $infoForm = $('#refresh-form')
  $infoForm.on 'ajax:success', (data) ->
    $('#calendar').fullCalendar('removeEvents')
    renderShifts()
    for event in data.detail[0]
      date = event.date
      $('#calendar').fullCalendar('renderEvent', {
        id: event.id,
        start: "#{date}T#{event.start}",
        end: "#{date}T#{event.end}",
        type: event.type,
        color: eventColor(event.type)
      })

  $createForm = $('#create-form')
  $createForm.on 'ajax:success', (data) ->
    requestLatestEvents()

  $deleteForm = $('#delete-form')
  $deleteForm.on 'ajax:success', (data) ->
    requestLatestEvents()

  #
  # fullCalendarSettings
  #

  # It runs every Ajax success
  requestLatestEvents = ->
    days = current_days()
    $infoForm.find('input[name="dates[]"]').remove()
    for day in days
      $infoForm.append "<input type='hidden' name='dates[]' value='#{day}'>"
    $infoForm.find('input[type="submit"]').click()

  eventClick = (event) ->
    if event.type == 'CleanOrder'
      open("/operator/clean_orders/#{event.id}", "_blank")
    else if event.type == 'IrregularOff'
      if confirm 'Are you sure to delete?'
        $deleteForm.attr('action', "/operator/irregular_offs/#{event.id}")
        $deleteForm.find('input[type="submit"]').click()

  $('#calendar').fullCalendar({
    themeSystem: 'bootstrap4',
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
    viewRender: requestLatestEvents,
    eventClick: eventClick
  })
