local lgi = require("lgi")
local Gtk = lgi.require("Gtk", "3.0")

local App = Gtk.Application({
  application_id = "com.github.moonsteal.lua-gtk-examples.GtkActionBar"
})

function App:on_startup()
  Gtk.ApplicationWindow({
    application = self,
    default_width = 400,
    default_height = 400
  })
end

function App:on_activate()
  self.active_window:set_titlebar(Gtk.HeaderBar({
    visible = true,
    show_close_button = true,
    title = "Your app title",
    subtitle = "Your app subtitle"
  }))

  local Box = Gtk.Box({ visible = true, orientation = Gtk.Orientation.VERTICAL })
  local Bar = Gtk.ActionBar({ visible = true })
  Bar:pack_start(Gtk.Label({ visible = true, label = "Something" }))
  Bar:pack_end(Gtk.Button({ visible = true, label = "A button" }))

  Box:pack_start(Gtk.Label({ visible = true, label = "Here is the content of your app" }), true, true, 0)
  Box:pack_end(Bar, false, true, 0)

  self.active_window:add(Box)
  self.active_window:present()
end

return App:run(arg)