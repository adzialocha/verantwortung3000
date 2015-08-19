//= require jquery
//= require jquery_ujs

//= require bootstrap-sprockets
//= require cocoon
//= require moment
//= require moment/de
//= require pickers
//= require bootstrap-datetimepicker

//= require_tree .

(function(window, document, $, undefined) {

  'use strict';

  function _initDatepickers() {

    $('.datetimepicker').datetimepicker({
      stepping: 15,
      defaultDate: '2016-09-01 10:00',
      minDate: '2016-08-31 15:00',
      maxDate: '2016-09-04 23:00'
    });

  }

  $(document).ready(function(){

    // datepicker setup

    _initDatepickers()

    // cocoon setup

    $(document).on('cocoon:after-insert', _initDatepickers);

    $('a.add_fields').
      data('association-insertion-method', 'after').
      data('association-insertion-node', '#cocoon-nested-container');

  });

})(window, document, window.jQuery);

