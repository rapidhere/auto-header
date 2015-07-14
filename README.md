Auto Header
===

Fast generate the header content of your project files!

Usage
---

`auto-header: generate` will change the header comment of current file

the default text is like this

```
# Copyright (c) 2015 by your name. All Rights Reserved.
```

to change the template this plugin generated, you can change the `auto-header.template` config.
Multi-line templates are not supported in current atom version, so you have to change it in `config.cson`, like

```cson
'*':
  'auto-header':
    'template': '''
      Copyright (c) {{year}} by {{author}}.
      All Rights Reserved.

      {{license-header}}
    '''
```

Tokens
---

Some tokens wrapped by `{{}}` will be replaced when render the template.

Here are all of them

### {{year}}
will be replaced by current year

### {{author}}
will be replaced by `auto-header.author` config

### {{license-header}}
will be replaced by license header specified by `auto-header.license` config

LICENSE
---

>   This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

>   This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

>   You should have received a copy of the Lesser GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

Author
---

*   call me via: rapidhere@gmail.com
*   or leave a issue on my github, issues and PRs are welcome
