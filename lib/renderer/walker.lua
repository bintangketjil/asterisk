-- walker.lua

local renderer = require("renderer")

local walker = {}

function walker.render(blocks)
   local output = {}

   for _, block in ipairs(blocks) do
      table.insert(
	 output,
	 renderer.block(
	    block,
	    walker.render
	 )
      )
   end

   return table.concat(output, "\n")
end

return walker
