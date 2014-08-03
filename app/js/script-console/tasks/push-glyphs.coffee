###
# # Push Glyphs
# A task to use any available transport ship to push all glyphs on one planet
# to a different planet.
###

'use strict'

templates = require 'js/templates'
Task = require 'js/task'

client = require 'js/client'

class PushGlyphs extends Task

    displayName: 'Push Glyphs'
    internalName: 'pushGlyphs'

    template: templates.get 'tasks.pushGlyphs'


    ###
    # ## PushGlyphs.loadOptions
    # See the documentation for the `Task` class for what this is.
    ###
    loadOptions: ->
        # TODO


    ###
    # ## PushGlyphs.run
    # See the documentation for the `Task` class for what this is.
    ###
    run: ->
        # client.Empire.get_status
        #     params: []
        #     scope: @
        #     success: (result) ->
        #         console.log 'success'
        #         console.log result
        #     error: (error) ->
        #         console.log error
        #         console.log 'error'

        client.Empire.get_status
            params: []
        # .then (err, res) ->
        #     console.log err, res
        # .done()



module.exports = new PushGlyphs()
