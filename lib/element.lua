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
   ul = true,
   ol = true,
   pre = true,
   button = true,
}

local function render_unwrapped(block)
   return pandoc.write(
      pandoc.Pandoc({
	    pandoc.Plain(block.content)
      }),
      "html"
   )
end

local unwrap_map = {
   p = "Para",
}

-- remove pandoc wrappers
-- p > a becomes a
local function get_unwrap(block)
   local unwrap = {}

   local value = block.attributes.unwrap

   if not value then
      return unwrap
   end

   for tag in value:gmatch("%S+") do
      local node = unwrap_map[tag]

      if node then
	 unwrap[node] = true
      end
   end

   return unwrap
end

function element.attributes(block)
   local attrs = {}

   for key, value in pairs(block.attributes) do
      if key ~= "tag" and key ~= "unwrap" then
	 attrs[key] = value
      end
   end

   if #block.classes > 0 then
      attrs.class = table.concat(block.classes, " ")
   end

   return attrs
end

-- custom handler
local handlers = {}

handlers.BulletList = function(block, parent)
   local items = {}

   for _,item in ipairs(block.content) do
      local content = pandoc.write(
	 pandoc.Pandoc(item),
	 "html"
      )
      table.insert(items, "<li>" .. content .. "</li>")
   end

   local result = table.concat(items, "\n")

   return result
end

handlers.OrderedList = function(block, parent)
   local items = {}

   for _,item in ipairs(block.content) do
      local content = pandoc.write(
	 pandoc.Pandoc(item),
	 "html"
      )
      table.insert(items, "<li>" .. content .. "</li>")
   end

   local result = table.concat(items, "\n")

   return result
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
   local unwrap = get_unwrap(block)
   local parts = {}

   for _, child in ipairs(content) do
      local handler = handlers[child.t]

      if handler then
	 table.insert(parts, handler(child, block, walk))

      elseif unwrap[child.t] then
	 local rendered = render_unwrapped(child)

	 if rendered then
	    table.insert(parts, rendered)
	 end
      else
	 local walked = walk.block(child)
	 
	 table.insert(parts, pandoc.write(
			 pandoc.Pandoc({ walked }),
			 "html"
	 ))
      end
   end

   local inner = table.concat(parts, "\n")

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
