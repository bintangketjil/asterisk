local element = require("element")
local fallback = require("fallback")

local walk = {}

function walk.block(blok)
   local result = element(block, walk)

   if result then
      return result
   end

   return fallback(block)
end

function walk.render(blocks)
   local output = {}

   for _, block in ipairs(blocks) do
      output[#output + 1] = walk.block(block)
   end

   return table.concat(output, "\n")
end

return walk
