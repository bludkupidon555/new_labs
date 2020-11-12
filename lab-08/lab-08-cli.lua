

red = require 'redis'
cli = red.connect('redis.fxnode.ru', 6379)

lgi = require 'lgi'

glib = lgi.GLib
gtk = lgi.Gtk

gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-08-cli.glade')

ui = bld.objects 

x = 0
y = 0

function ui.pb:on_draw(cr)
	cr:set_source_rgb(1, 1, 1)
	cr:paint()

	cr:set_source_rgb(0, 0,5, 1, 1)
	cr:rectangle(x, y, 10, 10)
	cr:fill()

	return true
end


function ui.MainForm:on_destroy(...)
	gtk.main_quit()
end


function on_timer()
	x = cli:get('turubar - x')
	x = cli:get('prilipchanu - x')
	y = cli:get('turubar - y')
	y = cli:get('prilipchanu - y')

	ui.pb:queue_draw()
	glib.timeout_add(glib.PRIORITY_DEFAULT, 10, on_timer)
end

ui.MainForm:show_all()

on_timer()

gtk.main()
