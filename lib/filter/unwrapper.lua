local targets = {
   "Image",
   "Link",
   "LineBreak",
   "Span",
}

function Para(element)
   if #element.content == 1 then
      for _, target in ipairs(targets) do
	 if element.content[1].t == target then
	    return element.content[1]
	 end
      end
   end
end
