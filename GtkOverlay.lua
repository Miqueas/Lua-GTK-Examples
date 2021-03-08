local lgi = require("lgi")
local Gtk = lgi.require("Gtk", "3.0")

local App = Gtk.Application({
  application_id = "com.github.moonsteal.lua-gtk-examples.GtkOverlay"
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

  local Overlay = Gtk.Overlay({
    visible = true,

    Gtk.Image({
      visible = true,
      icon_name = "firefox",
      pixel_size = 256
    })
  })

  Overlay:add_overlay(Gtk.Image({
    visible = true,
    icon_name = "firefox-symbolic",
    pixel_size = 128
  }))

  Overlay:add_overlay(Gtk.Image({
    visible = true,
    icon_name = "google-chrome",
    pixel_size = 64
  }))

  Overlay:add_overlay(Gtk.Image({
    visible = true,
    icon_name = "google-chrome-symbolic",
    pixel_size = 32
  }))

  self.active_window:add(Overlay)
  self.active_window:present()
end

return App:run(arg)