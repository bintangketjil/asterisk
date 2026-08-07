-- walk.lua
-- inspect children recursively
-- and find the custom nodes

local element = require("element")

local walk = {}

function walk.block(block)
   local result = element.render(block, walk)

   if result then
      return result
   end

   return walk.children(block)
end

function walk.children(block)
   if not block.content then
      return block
   end

   block.content = walk.blocks(block.content)

   return block
end

function walk.blocks(blocks)
   local output = {}

   for _, block in ipairs(blocks) do
      output[#output + 1] = walk.block(block)
   end

   return output
end

function walk.render(blocks)
   return walk.blocks(blocks)
end

return walk
