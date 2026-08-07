local html = {}

local function escape(value)
   value = tostring(value)

   value = value:gsub("&", "&amp;")
   value = value:gsub('"', "&quot;")
   value = value:gsub("<", "&lt;")
   value = value:gsub(">", "&gt;")

   return value;
end

function html.attributes(attrs)
   if not attrs then
      return ""
   end

   local output = {}

   for key, value in pairs(attrs) do
      table.insert(
	 output,
	 string.format(
	    '%s="%s"',
	    key,
	    escape(value)
	 )
      )
   end

   if #output == 0 then
      return ""
   end

   return " " .. table.concat(output, " ")
end

function html.element(tag, attrs, content)
   assert(tag, "html.element requires a tag")
   return table.concat({
	 "<",
	 tag,
	 html.attributes(attrs),
	 ">",
	 "\n",
	 content or "",
	 "\n",
	 "</",
	 tag,
	 ">"
   })

end

return html
