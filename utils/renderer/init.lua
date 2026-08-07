package.path = package.path .. ";./utils/?.lua;./utils/?/init.lua"

local renderer = {}

renderer.Div = require("renderer.div")
renderer.default = require("renderer.default")

function renderer.block(block, render_children)
   print("\nDISPATCH:", block.t)
   
   local fn = renderer[block.t]

   if fn then
      return fn(block, render_children)
   end

   return renderer.default(block)

end

return renderer
