local default = {}

return function(block)
   print("DEFAULT:", block.t)
   
   return pandoc.write(
      pandoc.Pandoc({ block }),
      "html"
   )

end
