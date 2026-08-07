package.path = package.path .. ";utils/?.lua;?.lua"

local html = require("html")

local render = {}

local function render_element(el)
   local tag = el.attributes.tag

   if not tag then
      return nil
   end

   local attrs = {}

   for key, value in pairs(el.attributes) do
      if key ~= "tag" then
	 attrs[key] = value
      end
   end

   local classes = {}

   for _, class in ipairs(el.classes) do
      if class ~= "element" then
	 table.insert(classes, class)
      end
   end

   if #classes > 0 then
      attrs.class = table.concat(classes, " ")
   end

   local content = render.body(el.content)

   return html.element(
      tag,
      attrs,
      content
   )
end

function render.block(block)
   if block.t == "Div" then
      if block.attributes.tag then
	 return render_element(block)
      end

      if inside_element then
	 return nil
      end
   end

   return nil
end

function render.body(blocks)
   local output = {}

   for _, block in ipairs(blocks) do
      local result = render.block(block)

      if result then
	 table.insert(output, result)
      else
	 table.insert(
	    output,
	    pandoc.write(
	       pandoc.Pandoc({block}),
	       "html"
	    )
	 )
      end
   end

   return table.concat(output, "\n")
end

return render
   
