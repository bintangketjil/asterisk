package.path = package.path .. ";libs/?.lua;?.lua"

local html = require("html")

local render = {}

local function render_div(el)
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

   local content = render.blocks(el.content)

   return html.element(
      tag,
      attrs,
      content
   )
end

function render.block(block)
   if block.t == "Div" then
      local result = render_div(block)

      if result then
	 return result
      end
   end

   local doc = pandoc.Pandoc({block})

   return pandoc.write(
      doc,
      "html"
   )
end

function render.blocks(blocks)
   local output = {}

   for _, block in ipairs(blocks) do
      local result = render.block(block)

      table.insert(output, result)
   end

   return table.concat(output, "\n")
end

return render
   
