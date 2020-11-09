lgi = require 'lgi'

gdk = lgi.Gdk
gtk = lgi.Gtk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-05.glade')

prov = gtk.CssProvider()
prov:load_from_path('style.css')
ctx=gtk.StyleContext()
scr=gdk.Screen.get_default()
ctx.add_provider_for_screen(scr, prov, gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

ui = bld.objects

ui.MainForm.title = 'lab-05_473_Turubar_Prilipchanu'
ui.MainForm.on_destroy = gtk.main_quit
ui.MainForm:show_all()

ui.DialogForm.title = 'lab-05_473_Turubar_Prilipchanu'

function ui.openB:on_clicked(...)
	ui.DialogForm:show_all()
end

function ui.closeB:on_clicked(...)
	ui.DialogForm:hide()
end

gtk.main()
