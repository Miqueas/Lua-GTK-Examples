local lgi = require("lgi")
local Gtk = lgi.require("Gtk", "3.0")

local App = Gtk.Application({
  application_id = "com.github.moonsteal.lua-gtk-examples.GtkApplicationWindow"
})

function App:on_startup()
  Gtk.ApplicationWindow({
    application = self,
    default_width = 400,
    default_height = 400
  })
end

function App:on_activate()
  --[[ GtkHeaderBar:

    A container that acts like the window titlebar

  ]]
  self.active_window:set_titlebar(Gtk.HeaderBar({
    -- By default, all GTK widgets are not visibles by default
    visible = true,
    -- Gtk.HeaderBar don't sets the window controls buttons by default
    show_close_button = true,
    title = "Your app title",
    subtitle = "Your app subtitle"
  }))
  self.active_window:present()
end

return App:run(arg)