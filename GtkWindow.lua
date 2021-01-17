local lgi = require("lgi")
local Gtk = lgi.require("Gtk", "3.0")

local Window = Gtk.Window({
  default_width = 400,
  default_height = 400
})

Window.on_destroy = Gtk.main_quit
Window:present()

Gtk.main()