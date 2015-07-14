# Copyright (c) 2015 by rapidhere, RANTTU. INC. All Rights Reserved.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the Lesser GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

{CompositeDisposable} = require('atom')
Generator = require('./generator')

module.exports = AutoHeader =
  # package configs
  config:
    template:
      title: 'template'
      description: 'the header template, multiple line please modify in config.cson'
      type: 'string'
      default: 'Copyright (c) {{year}} by {{author}}. All Rights Reserved.'

    # replace by {{author}}
    author:
      title: 'author'
      description: 'will replace {{author}} token by this config'
      type: 'string'
      default: 'your name'

    # replace by {{license-header}}
    license:
      title: 'license'
      description: 'indicate the license use by {{license-header}}'
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
