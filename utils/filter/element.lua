package.path = package.path .. ";libs/?.lua;?.lua"

local render = require("renderer")

function Pandoc(doc)
   local output = render.blocks(doc.blocks)

   return pandoc.Pandoc({
	 pandoc.RawBlock("html", output)
   })
end

