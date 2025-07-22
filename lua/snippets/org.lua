local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

-- Helper function to get current date
local function get_date()
  return os.date '%Y-%m-%d'
end

-- Helper function to get current ISO timestamp
local function get_timestamp()
  return os.date '%Y-%m-%d %H:%M:%S'
end

local snippets = {
  -- Basic header with title and date
  s(
    'header',
    fmt(
      [[
#+title: {}
#+date: {}
#+filetags: :{}:
        ]],
      {
        i(1, 'Title'),
        f(get_date),
        i(2, 'tag'),
      }
    )
  ),

  -- Heading properties
  s(
    'properties',
    fmt(
      [[
:PROPERTIES:
:ID:       {}
:END:
        ]],
      {
        i(1, 'id'),
      }
    )
  ),

  -- Source block
  s(
    'src',
    fmt(
      [[
#+begin_src {}
{}
#+end_src
        ]],
      {
        i(1, 'language'),
        i(2, '// your code here'),
      }
    )
  ),

  -- Todo item with timestamp
  s(
    'todo',
    fmt(
      [[
* TODO {}
DEADLINE: <{}> 
{}
        ]],
      {
        i(1, 'Task description'),
        f(get_timestamp),
        i(2, 'Additional notes'),
      }
    )
  ),

  -- Meeting notes template
  s(
    'meet',
    fmt(
      [[
* Meeting: {}
:PROPERTIES:
:Date: {}
:Participants: {}
:END:

** Agenda
{}

** Notes
{}

** Action Items
- [ ] {}
        ]],
      {
        i(1, 'Meeting Title'),
        f(get_date),
        i(2, 'participants'),
        i(3, 'agenda items'),
        i(4, 'meeting notes'),
        i(5, 'action item'),
      }
    )
  ),

  -- Quick quote block
  s(
    'quote',
    fmt(
      [[
#+begin_quote
{}
#+end_quote
        ]],
      {
        i(1, 'your quote here'),
      }
    )
  ),

  -- Project template
  s(
    'proj',
    fmt(
      [[
* {} [/]
:PROPERTIES:
:CREATED: {}
:CATEGORY: {}
:END:

** Description
{}

** Tasks
- [ ] {}

** Resources
- {}
        ]],
      {
        i(1, 'Project Name'),
        f(get_timestamp),
        i(2, 'category'),
        i(3, 'project description'),
        i(4, 'first task'),
        i(5, 'relevant links/resources'),
      }
    )
  ),

  -- Daily journal template
  s(
    'daily',
    fmt(
      [[
* {} Daily Journal
:PROPERTIES:
:CREATED: {}
:END:

** Morning Reflection
{}

** Today's Goals
- [ ] {}

** Evening Review
{}
        ]],
      {
        f(get_date),
        f(get_timestamp),
        i(1, 'morning thoughts'),
        i(2, 'primary goal'),
        i(3, 'evening reflection'),
      }
    )
  ),
  s(
    'table',
    fmt(
      [[
| {}
|-
|
        ]],
      {
        i(1, 'heading'),
      }
    )
  ),
}

-- Register the snippets
return snippets
