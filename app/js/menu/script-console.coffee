###
#
#
# # Script Console
#
# The Script Console is the interface that the player uses to automate their empire's
# repetitive tasks. The general idea is that a user can select a task to run, how
# often and what options to pass in and then the rest is handled. It is comprised of
# the following components:
#
# - A Github repository containing all of the the tasks I approve and have tested
#   to not be malicious and such.
# - A build-persistant data storage of some kind where all the data about tasks and
#   options that the user has setup. This could be a sqlite db or a json file. json
#   *might* work best here.
# - The GUI that pulls all of the above together for the user to use.
# - Finally, some kind of back-end scheduler that runs the tasks at the right time.
#
###

'use strict'

templates = require 'js/templates'
util = require 'js/util'

Lang = YAHOO.lang
Lacuna = YAHOO.lacuna
Game = Lacuna.Game

class ScriptConsole
    constructor: ->

        @id = 'about'
        @template = templates.get 'menu.scriptConsole'

        container = $('<div></div>').attr('id', @id).addClass('nofooter')
        $(document.body).prepend container

        @panel = new YAHOO.widget.Panel @id,
            constraintoviewport: true
            fixedcenter: true
            visible: false
            draggable: true
            effect: Game.GetContainerEffect()
            underlay: false
            close: true
            width: '600px'
            zIndex: 9999

        @panel.setHeader 'Script Console'
        Game.OverlayManager.register @panel

    ###
    # ## ScriptConsole.show
    # This is called by the menu when the user clicks on the 'Script Console' item
    # of the top menu bar.
    ###

    show: ->
        @render()
        @open()


    ###
    # ## ScriptConsle.open
    # This method uses `Game`'s `OverlayManager` to hide all other windows that
    # are open. Then it centers and shows the Script Console.
    ###

    open: ->
        Game.OverlayManager.hideAll()
        @panel.show()
        @panel.center()


    ###
    # ## ScriptConsole.render
    # Calls `setBody` on `@panel` to render the template into the `DOM`.
    ###

    render: ->
        @panel.setBody @template()


module.exports = new ScriptConsole()
