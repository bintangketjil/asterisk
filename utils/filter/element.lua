package.path = package.path .. ";libs/?.lua;?.lua"

local render = require("renderer")

function Pandoc(doc)
   local body = render.body(doc.blocks)

   return pandoc.Pandoc(
      {
	 pandoc.RawBlock("html", body)
      },
      doc.meta)
end

