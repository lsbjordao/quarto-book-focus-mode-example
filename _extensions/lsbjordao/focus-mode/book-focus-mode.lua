function Meta(meta)
  if not quarto.doc.is_format("html") then
    return meta
  end

  local source = debug.getinfo(1, "S").source
  if source:sub(1, 1) == "@" then
    source = source:sub(2)
  end
  local dir = pandoc.path.directory(source)

  quarto.doc.add_html_dependency({
    name = "focus-mode",
    version = "1.0.0",
    stylesheets = { pandoc.path.join({ dir, "focus-mode.css" }) },
    scripts    = { pandoc.path.join({ dir, "focus-mode.js"  }) },
  })

  return meta
end
