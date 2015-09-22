# = require jquery
# = require jquery_ujs
# = require bootstrap-sprockets
# = require fancybox

((window, document, $) ->

  'use strict'

  $(document).ready () ->

    $('a.fancybox').fancybox({
      closeClick: true,
      closeBtn: false,
      padding : 0,
      openEffect: 'none',
      closeEffect: 'none',
      helpers : {
        overlay : {
          speedOut: 0,
          css : {
            'background' : 'rgba(0, 0, 0, .9)'
          }
        }
      }
    })

    # navigation collapse no-scroll hack

    $(document).on 'show.bs.collapse', () ->
      $('body').addClass 'nav-collapsed'

    $(document).on 'hidden.bs.collapse', () ->
      $('body').removeClass 'nav-collapsed'

) window, document, window.jQuery

