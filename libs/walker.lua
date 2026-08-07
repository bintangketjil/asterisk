local walker = {}

function walker.children(block)
   if block.t == "Div" then
      return { block.content }
   end

   if block.t == "BlockQuote" then
      return { block.content }

   end

   if block.t == "BulletList" then
      return block.content
   end

   if block.t == "OrderedList" then
      return block.content
   end
   
   return nil
end


function walker.walk(blocks, visitor, depth)
   depth = depth or 0
   
   for _, block in ipairs(blocks) do
      walker.block(block, visitor, depth)
   end
end

function walker.block(block, visitor, depth)
   visitor(block, depth)

   local children = walker.children(block)

   if children then
      for _, blocks in ipairs(children) do
	 walker.walk(blocks, visitor, depth + 1)
      end
   end
   
end

return walker
