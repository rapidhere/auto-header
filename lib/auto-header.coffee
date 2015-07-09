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

{CompositeDisposable} = require 'atom'

module.exports = AutoHeader =
  subscriptions: null

  activate: (state) ->
      @subscriptions = new CompositeDisposable
      @subscriptions.add(atom.commands.add('atom-workspace',
        'auto-header:generate': =>@generate())

  deactivate: ->
    @subscriptions.dispose()

  generate: ->
    console.log 'AutoHeader was triggered!'
