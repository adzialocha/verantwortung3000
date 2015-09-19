# = require cocoon
# = require moment
# = require moment/de
# = require pickers
# = require bootstrap-datetimepicker

((window, document, $) ->

  'use strict'

  _initFileSelectors = ($event, cInsertedItem) ->

    $selectItem = cInsertedItem.find '.select-file'
    $originalItem = cInsertedItem.find 'input[type="file"]'
    $previewItem = cInsertedItem.find '.preview'

    # workaround for custom file selector input

    $selectItem.on 'click', () ->
      $originalItem.trigger 'click'

    # show preview of local image

    $originalItem.on 'change', ($event) ->

      if $event.target.files and $event.target.files[0]

        reader = new FileReader()

        reader.onload = ($res) ->
          $previewItem.attr 'src', $res.target.result

        reader.readAsDataURL $event.target.files[0]

  _initItemPickers = ($event, cInsertedItem) ->

    # init item pickers

    $parent = cInsertedItem

    $selectElem = $parent.find 'input[type="number"]'
    $createElem = $parent.find '.items-select__create'

    $createElem.hide()

    $parent.find('.items-select__cell').on 'click', () ->

      $cell = $(this)

      if $cell.data('disabled')
        return false

      unless $cell.hasClass 'items-select__cell--selected'

        $cell.parent().parent().find('.items-select__cell').removeClass 'items-select__cell--selected'

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
      defaultDate: '2016-08-30 10:00'
      minDate: '2016-08-30 10:00'
      maxDate: '2016-09-04 23:00'

    # item picker setup

    $('.items-select').each () ->

      $numberItem = $(this).find 'input[type="number"]'
      $firstItem = $(this).find '.items-select__cell--default'

      val = $numberItem.val()

      if not val? or val == ''

        _initItemPickers null, $(this)

        $selectedItem = $firstItem
        $(this).find('.items-select__create').show()

      else

        $(this).addClass 'items-select--disabled'

        $selectedItem = $(this).find '.items-select__cell[data-value="' + val + '"]'

        $firstItem.parent().remove()
        $(this).find('.items-select__cell[data-value!="' + val + '"]').parent().remove()

      $selectedItem.addClass 'items-select__cell--selected'

    # cocoon setup

    $(document).on 'cocoon:after-insert', ($event, cInsertedItem) ->

      _initItemPickers($event, cInsertedItem)
      _initFileSelectors($event, cInsertedItem)

    $('.cocoon a.add_fields').data('association-insertion-method', 'before').data('association-insertion-traversal', 'closest').data 'association-insertion-node', '.cocoon'

    # toggle help button

    $('.well').hide()

    $('.toggle-help').on 'click', ($event) ->

      $($event.target).toggleClass 'toggle-help--activated'
      $('.well').toggle()

) window, document, window.jQuery
