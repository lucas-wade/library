
$(document).on 'page:update', ->
  animation = (el, animation) ->
    el.addClass animation
    return

  $('.btn-main-menu.b1').on 'click', ->
    animation $('.column-2'), 'fadeOutRight'
    animation $('.column-3'), 'fadeOutRight'
    return
  $('.btn-main-menu.b2').on 'click', ->
    animation $('.column-1'), 'fadeOutLeft'
    animation $('.column-2'), 'slideOutRight'
    animation $('.column-3'), 'fadeOutRight'
    return
  $('.btn-main-menu.b3').on 'click', ->
    animation $('.column-1'), 'fadeOutLeft'
    animation $('.column-2'), 'fadeOutLeft'
    return
  return
$(document).on 'page:change', ->
  $('.column-1').removeClass('fadeOutLeft').addClass 'fadeInLeft'
  $('.column-2').removeClass('fadeOutRight fadeOutLeft slideOutRight').addClass 'fadeInDown'
  $('.column-3').removeClass('fadeOutRight').addClass 'fadeInRight'
  return

