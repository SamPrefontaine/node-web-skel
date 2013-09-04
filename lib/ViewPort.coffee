class ViewPort
  constructor: ()->
    @hasViewPort      = true
    @viewPort         = {}
    @viewPort.methods = []

  routeViewPort: ()->
    web  = @
    app  = @app

    app.get '/api/view/:method', (req, res)->
      if !req.query
        res.send { err: "No GET Query data defined" }
        return

      method = req.params.method

      switch method
        when "getViewByName"
          if !req.query.name then return res.send { err: "No name parameter provided in query data" }

          name = req.query.name

          app.render "#{name}/body.jade", { name: name, user: req.user || undefined }, (err, html)->
            return res.send { success: true, err: err, html: html }

        when "getGlobalNavigation"
          if !req.query.name then return res.send { err: "No name parameter provided in query data" }

          name = req.query.name

          app.render "globalNavigation.jade", { name: name, user: req.user || undefined }, (err, html)->
            return res.send { success: true, html: html, err: err }

        when "getCarouselForViewName"
          if !req.query.name then return res.send { err: "No name parameter provided in query data" }

          name = req.query.name

          app.render "carousel.jade", { name: name, user: req.user || undefined }, (err, html)->
            return res.send { success: true, err: err, html: html }

    @viewPort.methods.push
      name: "getCarouselForViewName"

    @viewPort.methods.push
      name: "getGlobalNavigation"

    @viewPort.methods.push
      name: "getViewByName"

    return @

module.exports = ViewPort