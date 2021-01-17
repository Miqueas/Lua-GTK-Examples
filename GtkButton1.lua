local lgi = require("lgi")
local Gtk = lgi.require("Gtk", "3.0")
local Gio = lgi.require("Gio", "2.0")

local App = Gtk.Application({
  application_id = "com.github.moonsteal.lua-gtk-examples.GtkButton1"
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
    title = "GtkButton",
    subtitle = "Example 1"
  }))

  --[[ GtkButton:

    A button lol

  ]]
  local Button = Gtk.Button({
    visible = true,
    label = "Click me!",
    valign = Gtk.Align.CENTER,
    halign = Gtk.Align.CENTER
  })

  local Notification_ID = 0

  -- The "clicked" signal is emited when the user clicks
  -- the button
  function Button:on_clicked()
    local Notification = Gio.Notification()
    Notification:set_title("GtkButton example 1")
    Notification:set_body("You cliked the button!")

    -- 'self' can't be used here, because 'self' here
    -- reffers to 'Button'
    App:send_notification(Notification_ID, Notification)

    -- Incrementing this value makes the app spawn various
    -- notifications
    Notification_ID = Notification_ID + 1
  end

  self.active_window:add(Button)
  self.active_window:present()
end

return App:run(arg)