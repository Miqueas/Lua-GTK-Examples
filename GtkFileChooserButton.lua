local lgi = require("lgi")
local Gtk = lgi.require("Gtk", "3.0")

local App = Gtk.Application({
  application_id = "com.github.moonsteal.lua-gtk-examples.GtkFileChooserButton"
})

function App:on_startup()
  Gtk.ApplicationWindow({
    application = self,
    default_width = 400,
    default_height = 400,
    border_width = 10,

    Gtk.Box({
      visible = true,
      spacing = 10,
      orientation = Gtk.Orientation.VERTICAL,
      valign = Gtk.Align.CENTER,
      halign = Gtk.Align.CENTER,

      Gtk.Label({ visible = true, label = "Open a file" }),

      Gtk.FileChooserButton({
        id = "Btn",
        visible = true,
        valign = Gtk.Align.CENTER,
        halign = Gtk.Align.CENTER
      }),

      Gtk.Label({ id = "Lbl", visible = true, wrap = true })
    })
  })
end

function App:on_activate()
  self.active_window:set_titlebar(Gtk.HeaderBar({
    visible = true,
    show_close_button = true,
    title = "GtkFileChooserButton",
    subtitle = "Basic example"
  }))

  local Btn = self.active_window.child.Btn
  local Lbl = self.active_window.child.Lbl

  function Btn:on_file_set()
    Lbl.label = "Selected file: " .. self:get_filename()
  end

  self.active_window:present()
end

return App:run()