local lgi = require("lgi")
local Gtk = lgi.require("Gtk", "3.0")

local App = Gtk.Application({
  application_id = "com.github.moonsteal.lua-gtk-examples.GtkApplication"
})

-- For more info about these signals, see this:
-- https://wiki.gnome.org/HowDoI/GtkApplication
-- https://developer.gnome.org/gio/stable/GApplication.html
-- https://developer.gnome.org/gtk3/stable/GtkApplication.html
function App:on_startup()
  print("Application::startup called")
end

function App:on_activate()
  print("Application::activate called")
end

return App:run(arg)