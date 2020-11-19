lgi = require 'lgi'

gtk = lgi.Gtk
gdk = lgi.Gdk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-09.glade')

prov = gtk.CssProvider()
prov:load_from_path('style.css')
ctx=gtk.StyleContext()
scr=gdk.Screen.get_default()
ctx.add_provider_for_screen(scr, prov, gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

ui = bld.objects

ui.MainForm.title = 'lab-09_473_Turubar_Prilipchanu'
ui.MainForm.on_destroy = gtk.main_quit
ui.MainForm:show_all()

local x = 0
local y = 0

local btn = false

local cr = 0
local cg = 0
local cb = 0

function ui.pb:on_button_press_event(evt)
	btn = true
	ui.pb:queue_draw()
end

function ui.pb:on_button_release_event(evt)
	btn = false
	ui.pb:queue_draw()
end

function ui.pb:on_motion_notify_event(evt)
	x = evt.x
	y = evt.y
	ui.pb:queue_draw()
end

function ui.tb_r:on_value_changed()
	cr = ui.tb_r:get_value()
	ui.pb:queque_draw()
end

function ui.tb_g:on_value_changed()
	cg = ui.tb_g:get_value()
	ui.pb:queque_draw()
end

function ui.tb_b:on_value_changed()
	cb = ui.tb_b:get_value()
	ui.pb:queque_draw()
end

function ui.pb:on_draw(ce)
	ce:set_source_rgb(1, 1, 1)
	ce:paint()

	ce:set_source_rgb(cr, cg, cb, 1)
	if(btn == false) then
		ce:rectangle(x-5, y-5, 10, 10)
	else
		ce:rectangle(x-10, y-10, 20, 20)
	end
	ce:fill()
end

function ui.MainForm:on_destroy()
	gtk.main_quit()
end

gtk.main()
