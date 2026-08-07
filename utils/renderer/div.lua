print(package.searchpath("html", package.path))
print(package.searchpath("renderer.html", package.path))

local html = require("html")

return function(block, render_children)
   local tag = block.attributes.tag

   if not tag then
      return render_children(block.content)
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

   return html.element(
      tag,
      attrs,
      render_children(block.content)
   )
end
