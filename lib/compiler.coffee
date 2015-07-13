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

# template compiler
# this is a singleton

class Compiler
  constructor:->
    @compileMethodList = []

  # add a compile method
  # will pass the compiler instance and text to compile
  addCompileMethod: (fn)->
    @compileMethodList.push(fn)

  # compile the template, and return the compiled text
  compile: (text)->
    for fn in @compileMethodList
      text = fn(text, this)
    text

# compile methods start here
_defaultCompileMethods = [
  # {{year}} token
  (text, compiler)->
    d = new Date()
    text.replace(/{{year}}/g, d.getFullYear())

  # {{author}} token, get from 'auto-header.author'
  (text, compiler)->
    text.replace(/{{author}}/g, atom.config.get('auto-header.author'))
]

# single compiler
_compiler = new Compiler

# add default compile method to compiler
_compiler.addCompileMethod(fn) for fn in _defaultCompileMethods

# exposed singleton method
exports.getCompiler = -> _compiler
