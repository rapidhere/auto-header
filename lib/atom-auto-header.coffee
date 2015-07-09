AtomAutoHeaderView = require './atom-auto-header-view'
{CompositeDisposable} = require 'atom'

module.exports = AtomAutoHeader =
  atomAutoHeaderView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @atomAutoHeaderView = new AtomAutoHeaderView(state.atomAutoHeaderViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @atomAutoHeaderView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-auto-header:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @atomAutoHeaderView.destroy()

  serialize: ->
    atomAutoHeaderViewState: @atomAutoHeaderView.serialize()

  toggle: ->
    console.log 'AtomAutoHeader was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
