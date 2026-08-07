return function(block, walk)
   if block.t ~= "Div" then
      return nil
   end

   local tag = block.attributes.tag

   if not tag then
      return nil
   end

   local attrs = {}

   for k, v in pairs(block.attributes) do
      if k ~= "tag" then
	 attrs[k] = v
      end
   end

   if #block.classes > 0 then
      attrs.class = table.concat(block.classes, " ")
   end

   return table.concat({
	 "<", tag, ">\n",
	 walk.render(block.content),
	 "\n</", tag, ">"
   })
