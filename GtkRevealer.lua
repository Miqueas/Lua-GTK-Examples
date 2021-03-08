local lgi = require("lgi")
local Gtk = lgi.require("Gtk", "3.0")

local App = Gtk.Application({
  application_id = "com.github.moonsteal.lua-gtk-examples.GtkPaned"
})

function App:on_startup()
  Gtk.ApplicationWindow({
    application = self,
    default_width = 400,
    default_height = 400
  })
end

function App:on_activate()
  local Header = Gtk.HeaderBar({
    visible = true,
    show_close_button = true,
    title = "Your app title",
    subtitle = "Your app subtitle"
  })

  local Btn = Gtk.Button({ visible = true, label = "Show message" })
  Header:pack_start(Btn)
  self.active_window:set_titlebar(Header)

  local Box = Gtk.Box({ visible = true, orientation = Gtk.Orientation.VERTICAL })
  local Rev = Gtk.Revealer({
    visible = true,

    Gtk.Label({ visible = true, label = "Hello there!", margin = 10 })
  })

  function Btn:on_clicked()
    if Rev.reveal_child then
      Rev.reveal_child = false
    else
      Rev.reveal_child = true
    end
  end

  Box:pack_start(Rev, false, true, 0)

  self.active_window:add(Box)
  self.active_window:present()
end

return App:run(arg)