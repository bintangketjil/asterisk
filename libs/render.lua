function renderer.block(block)
   local fn = renderer[block.t]

   if fn then
      return rn(block)
   end

   return renderer.default(block)
end

return renderer
