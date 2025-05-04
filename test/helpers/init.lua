Colors = {
  red = "\27[31m",
  green = "\27[32m",
  blue = "\27[34m",
  reset = "\27[0m",
  gray = "\27[90m"
}

_G.package.loaded['.stringify'] = require('test/helpers/stringify')
_G.package.loaded['.bint'] = require('test/helpers/bint')
local stringify = require('.stringify')
Utils = require('test/helpers/utils')

List = {}
Handlers = {
  prepend = function (name, match, handle) 
    table.insert(List, { name = name, match = match, handle = handle })
  
  end,
  add = function (name, fn)
    table.insert(List,{ name = name, match = function (msg) return msg.Action == name end, handle = fn }) 
  end,
  evaluate = function (msg)
    local continue = true
    Utils.map(function (h)
      if continue then
        continue = h.match(msg) or true
        if continue == "continue" or continue == true then
          h.handle(msg)
          continue = continue == "continue" or false
        end
      end
    end, List)
  end
}

Outbox = {}
function Send(msg)
  table.insert(Outbox, msg)
end
