class Controller

  constructor: ()->
    @view = 'index'

    @displayView()
    @displayGlobalNavgation()
    @addGlobalNavigationClickEvents()
    @displayCarousel()

  displayView: ()->
    controller = @
    $.ajax
      url: '/api/view/getViewByName'
      data:
        name: @view
      success: (data)->
        if !data.html
          alert('unable to load view html for ' + controller.view)

        if data.err
          console.log data.err

        $("#bodyDiv").hide().html(data.html).fadeIn('slow')
      dataType: 'json'

    return @

  displayGlobalNavgation: ()->
    $.ajax
      url: '/api/view/getGlobalNavigation'
      data:
        name: @view
      success: (data)->
        $("#globalNavigationDiv").html data.html
      dataType: 'json'

    return @

  displayCarousel: ()->
    $.ajax
      url: '/api/view/getCarouselForViewName'
      data:
        name: @view
      success: (data)->
        $("#carousel").hide().html(data.html).fadeIn('slow')
      dataType: 'json'

    return @

  addGlobalNavigationClickEvents: ()->
    controller = @

    $("#bodyDiv").on 'click', 'a', (e)->
      component = $(this).data("component")
      method    = $(this).data("method")

      switch component
        when "view"

          switch method
            when "getViewByName"
              $("#globalNavigationDiv a").parent().removeClass('active')

              if $("#carousel").is(":visible")
                $("#carousel").fadeOut('slow')

              controller.view = $(this).data("name")
              controller.displayView()

              if $(this).data("name") is "index"
                $("#carousel").fadeIn('slow')

              if $(this).data("name") is "about"
                $("#navAboutLink").parent().addClass('active')

    $("#carousel").on 'click', 'a', (e)->
      component = $(this).data("component")
      method    = $(this).data("method")

      switch component
        when "view"

          switch method
            when "getViewByName"
            # reset the active nav links
              $("#globalNavigationDiv a").parent().removeClass('active')

              # display the new template
              controller.view = $(this).data("name")
              controller.displayView()

              if $("#carousel").is(":visible")
                $("#carousel").fadeOut('slow')

              if $(this).data("name") is "index"
                $("#carousel").fadeIn('slow')

              if $(this).data("name") is "about"
                $("#navAboutLink").parent().addClass('active')

              if $(this).data("name") is "knowledge"
                $("#navKnowledgeLink").parent().addClass('active')

    $("#globalNavigationDiv").on 'click', 'a', (e)->

      component = $(this).data("component")
      method    = $(this).data("method")

      switch component
        when "view"

          switch method
            when "getViewByName"
              # reset the active nav links
              $("a").parent().removeClass('active')
              $(this).parent().addClass('active')

              # display the new template
              controller.view = $(this).data("name")
              controller.displayView()

              if $("#carousel").is(":visible")
                $("#carousel").fadeOut('slow')

              if $(this).data("name") is "index"
                $("#carousel").fadeIn('slow')

    return @

window.Controller = Controller