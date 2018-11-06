class Tools

  constructor: (args) ->
    # body...

  displayErrors: (form, errors) ->
    form.find('.form-group label.error').remove()

    for field of errors
      if errors.hasOwnProperty(field)
        message = errors[field][0]

        input = $("[name$='resource[#{field.split('.')[field.split('.').length - 1]}]']")

        if input.length == 1
          input.closest('.form-group').append("<label class='error'>#{message}</label>")

  inputMask: (input, format) ->
    $("#{input}").inputmask("#{format}")

  modal: (content= null, options= {})->
      defaultOpts =
        modalId: "main-modal"
        modalClass: null
        onlyBody: false
      settings = $.extend(true, defaultOpts, options)
      modal = $("##{settings.modalId}")
      modalDialog = $(".modal-dialog", modal)
      if modal.length == 0
        $("body").append("<div id='#{settings.modalId}' class='modal  fade'></div>")
        modal = $("##{settings.modalId}")
        modalDialog = $("<div class='modal-dialog'></div>")
        modalContent = $("<div class='modal-content'></div>")
        modalContent.append("<div class='modal-body'></div>")
        modalDialog.append(modalContent)
        modal.empty().append(modalDialog)

      modal.modal
        keyboard:true
        backdrop:true
        show: false
      if content?
        if settings.onlyBody
          modalDialog.addClass(settings.modalClass) if settings.modalClass? and !modalDialog.hasClass(settings.modalClass)
          $(".modal-body",modal).empty().append(content)
        else
          modal.empty().append(content)
        modal.modal("show")
      else
        modal.modal("hide")
      return modal

@Tools = new Tools()
