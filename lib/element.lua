-- /lib/element.lua
-- transform custom nodes into valid html

local html = require("html")

local element = {}

local allowed = {
   a = true,
   article = true,
   aside = true,
   footer = true,
   header = true,
   main = true,
   nav = true,
   section = true,
   div = true,
   p = true,
   span = true,
}

function element.attributes(block)
   local attrs = {}

   for key, value in pairs(block.attributes) do
      if key ~= "tag" then
	 attrs[key] = value
      end
   end

   if #block.classes > 0 then
      attrs.class = table.concat(block.classes, " ")
   end

   return attrs
end

function element.render(block, walk)
   if block.t ~= "Div" then
      return nil
   end

   local tag = block.attributes.tag

   if not tag then
      return nil
   end

   if not allowed[tag] then
      return nil
   end

   local content = walk.blocks(block.content)

   local inner = pandoc.write(
      pandoc.Pandoc(content),
      "html"
   )

   return pandoc.RawBlock(
      "html",
      html.element(
	 tag,
	 element.attributes(block),
	 inner
      )
   )
end

return element
