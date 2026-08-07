-- element.lua filter

local sep = package.config:sub(1, 1)

local root = PANDOC_SCRIPT_FILE:match("^(.*" .. sep .. ")")

local function append (path)
   if not package.path:find(path, 1, true) then
      package.path = package.path .. ";" .. path
   end
end

append(root .. "lib/?.lua")
append(root .. "lib/?/init.lua")
append(root .. "lib/?/?/?.lua",)


local walk = require("walk")

function Pandoc(doc)
   local output = walk.render(doc.blocks)

   return pandoc.Pandoc(
      {
	 pandoc.RawBlock("html", output)
      },
      doc.meta)
end

