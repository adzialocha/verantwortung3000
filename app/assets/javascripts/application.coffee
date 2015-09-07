# = require jquery
# = require jquery_ujs
# = require bootstrap-sprockets
# = require cocoon
# = require moment
# = require moment/de
# = require pickers
# = require bootstrap-datetimepicker
# = require_tree .

((window, document, $) ->

  'use strict'

  _initItemPickers = ($event, cInsertedItem) ->

    $parent = cInsertedItem

    $selectElem = $parent.find 'input[type="number"]'
    $createElem = $parent.find '.items-select__create'

    $selectElem.hide()
    $createElem.hide()

    $parent.find('.items-select__cell').on 'click', () ->

      $cell = $(this)

      if $cell.data('disabled')
        return false

      unless $cell.hasClass 'items-select__cell--selected'

        $cell.siblings('.items-select__cell').removeClass 'items-select__cell--selected'

        $cell.addClass 'items-select__cell--selected'

        val = $cell.data('value')

        if val == -1

          $selectElem.val ''
          $createElem.show()

        else

          $createElem.hide()
          $selectElem.val $cell.data('value')

      else

        $createElem.hide()
        $cell.removeClass 'items-select__cell--selected'
        $selectElem.val ''

  $(document).ready () ->

    # jquery datetimepicker setup

    $('.datetimepicker').datetimepicker

      stepping: 15
      defaultDate: '2016-09-01 10:00'
      minDate: '2016-08-31 15:00'
      maxDate: '2016-09-04 23:00'

    # item picker setup

    $('.items-select').each () ->

      _initItemPickers null, $(this)

      $numberItem = $(this).find 'input[type="number"]'
      val = $numberItem.val()

      if not val? or val == ''

        $(this).find('.items-select__cell:first-child').addClass 'items-select__cell--selected'
        $(this).find('.items-select__create').show()

      else

        $(this).find('.items-select__cell[data-value="' + val + '"]').addClass 'items-select__cell--selected'

    # cocoon setup

    $(document).on 'cocoon:after-insert', _initItemPickers

    $('.cocoon-nested-container a.add_fields').data('association-insertion-method', 'after').data('association-insertion-traversal', 'closest').data 'association-insertion-node', '.cocoon-nested-container'

    # toggle help button

    $('.well').hide()

    $('.toggle-help').on 'click', () -> $('.well').toggle()

) window, document, window.jQuery
