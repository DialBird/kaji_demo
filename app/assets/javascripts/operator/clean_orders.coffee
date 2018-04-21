$ ->
  $('.assign_staff_btn').on 'click', ->
    if confirm('よろしいですか？')
      $form = $('#assign_staff_form')
      $form.find('input[name="staff_id"]').val $(@).data('staff-id')
      $('#assign_staff_form').submit()
