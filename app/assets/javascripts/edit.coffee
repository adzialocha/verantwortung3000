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

  _createNewItem = (cInsertedItem) ->

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

  _prepareItemSelection = ($item) ->

    $numberItem = $item.find 'input[type="number"]'
    $firstItem = $item.find '.items-select__cell--default'

    val = $numberItem.val()

    if not val? or val == ''

      $selectedItem = $firstItem
      $item.find('.items-select__create').show()
      $item.find('.items-select__cell[data-value!="-1"]').parent().remove()

    else

      $item.addClass 'items-select--disabled'

      $selectedItem = $item.find '.items-select__cell[data-value="' + val + '"]'

      $firstItem.parent().remove()
      $item.find('.items-select__cell[data-value!="' + val + '"]').parent().remove()

    $selectedItem.addClass 'items-select__cell--selected'

  $(document).ready () ->

    # jquery datetimepicker setup

    $('.datetimepicker').datetimepicker

      stepping: 15
      defaultDate: '2016-08-30 10:00'
      minDate: '2016-08-30 10:00'
      maxDate: '2016-09-04 23:00'

    # item picker setup

    $('.cocoon .items-select').each () ->
      _prepareItemSelection $(this)

    $('.modal .items-select').each () ->
      _createNewItem $(this)

    # cocoon setup

    $('.modal').on 'hidden.bs.modal', ($event) ->

      $modal = $($event.target)

      $modal.find('input[type="number"]').val ''
      $modal.find('.blackboard_title').val ''
      $modal.find('.blackboard_description').val ''

      $modal.find('.items-select__cell').removeClass 'items-select__cell--selected'
      $modal.find('.items-select__create').hide()

    $('#collaboration-modal-submit').on 'click', ($event) ->

      $modal = $ '#collaboration-modal'

      # validation

      modalValue = $modal.find('input[type="number"]').val()
      modalTitle = $modal.find('.blackboard_title').val()
      modalDescription = $modal.find('.blackboard_description').val()

      if modalValue or (modalTitle and modalDescription)

        $modal.find('.cocoon-add-collaboration').trigger 'click'
        $('#collaboration-modal').modal 'hide'

    $('#requirement-modal-submit').on 'click', () ->

      $modal = $ '#requirement-modal'

      # validation

      modalValue = $modal.find('input[type="number"]').val()
      modalTitle = $modal.find('.blackboard_title').val()
      modalDescription = $modal.find('.blackboard_description').val()

      if modalValue or (modalTitle and modalDescription)

        $modal.find('.cocoon-add-requirement').trigger 'click'
        $('#requirement-modal').modal 'hide'

    $(document).on 'cocoon:after-insert', ($event, cInsertedItem) ->

      if $event.target.id == 'cocoon-collaboration'
        $modal = $ '#collaboration-modal'
      else if $event.target.id == 'cocoon-requirement'
        $modal = $ '#requirement-modal'
      else
        _initFileSelectors $event, cInsertedItem
        return true

      cInsertedItem.find('input[type="number"]').val $modal.find('input[type="number"]').val()
      cInsertedItem.find('.blackboard_title').val $modal.find('.blackboard_title').val()
      cInsertedItem.find('.blackboard_description').val $modal.find('.blackboard_description').val()

      _prepareItemSelection cInsertedItem

    $('.cocoon a.add_fields').data('association-insertion-method', 'before').data('association-insertion-traversal', 'closest').data 'association-insertion-node', '.cocoon'

    $('.cocoon-add-collaboration').data('association-insertion-method', 'before').data 'association-insertion-node', '.cocoon-collaboration'

    $('.cocoon-add-requirement').data('association-insertion-method', 'before').data 'association-insertion-node', '.cocoon-requirement'

    # toggle help button

    $('.well').hide()

    $('.toggle-help').on 'click', ($event) ->

      $($event.target).toggleClass 'toggle-help--activated'
      $('.well').toggle()

) window, document, window.jQuery
