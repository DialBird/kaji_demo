$ ->
  Activate = ($elem, classname) ->
    $elem.show()
    $elem.find(classname).each -> $(@).prop('disabled', false)

  Inactivate = ($elem, classname) ->
    $elem.hide()
    $elem.find(classname).each -> $(@).prop('disabled', true)

  SwitchShiftPanelStatus = ($checker) ->
    $active = $checker.closest('.dayofweek_field').find('.active')
    $inactive = $checker.closest('.dayofweek_field').find('.inactive')

    if $checker.is(':checked')
      Activate($inactive, '.time-input')
      Inactivate($active, '.time-input')
    else
      Activate($active, '.time-input')
      Inactivate($inactive, '.time-input')

  $('input.is-rest').on 'change', ->
    SwitchShiftPanelStatus($(@))

  $('input.is-rest').each (_, elem) ->
    SwitchShiftPanelStatus($(elem))

  $('#create-form').on 'submit', ->
    $('#create_modal').modal('toggle')
