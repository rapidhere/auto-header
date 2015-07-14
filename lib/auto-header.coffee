# Copyright (c) 2015 by rapid. All Rights Reserved.

{CompositeDisposable} = require('atom')
Generator = require('./generator')

module.exports = AutoHeader =
  # package configs
  config:
    template:
      # title: 'template'
      # description: 'the header template, multiple line please modify in config.cson'
      type: 'string'
      default: 'Copyright (c) {{year}} by {{author}}. All Rights Reserved.'

    # replace by {{author}}
    author:
      # title: 'author'
      # description: 'will replace {{author}} token by this config'
      type: 'string'
      default: 'your name'

    # replace by {{license-header}}
    license:
      # title: 'license'
      # description: 'indicate the license use by {{license-header}}'
      # TODO: change type to list
      type: 'string'
      enum: ['apachev2', 'bsdv2', 'bsdv3', 'gplv2', 'gplv3', 'lgplv2', 'lgplv3', 'mit', 'mplv2']
      default: 'lgplv3'

  activate: (state) ->
    @subscriptions = new CompositeDisposable()

    @subscriptions.add(atom.commands.add('atom-workspace',
      'auto-header:generate': =>@generate()))

  deactivate: ->
    @subscriptions.dispose()

  generate: ->
    # get new generator for current file
    generator = new Generator(atom.workspace.getActiveTextEditor())

    # sync the header content
    generator.sync()
