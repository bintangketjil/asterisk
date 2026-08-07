-- lib/filter/element.lua
-- custom pandoc blocks

local sep = package.config:sub(1, 1)

local root = PANDOC_SCRIPT_FILE:match("^(.*" .. sep .. ")")

package.path = table.concat({
      package.path,
      "lib/?.lua",
}, ";")

local walk = require("walk")

function Pandoc(doc)

   doc.blocks = walk.blocks(doc.blocks)

   return doc
end

