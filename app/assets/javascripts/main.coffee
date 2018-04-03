$ ->
  $("ul.dropdown-menu > li > a[href]").each () ->
    if (this.href == window.location.href)
      $(@).find('.fa').removeClass('invisible')
