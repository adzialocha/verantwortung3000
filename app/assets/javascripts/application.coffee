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
            'background' : 'rgba(58, 42, 45, 0.95)'
          }
        }
      }
    })

) window, document, window.jQuery
