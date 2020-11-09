lgi = require 'lgi'

gtk = lgi.Gtk
gdk = lgi.Gdk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-03.glade')

prov = gtk.CssProvider()
prov:load_from_path('style.css')
ctx=gtk.StyleContext()
scr=gdk.Screen.get_default()
ctx.add_provider_for_screen(scr, prov, gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

ui = bld.objects

ui.MainForm.title = 'lab-03_473_Turubar_Prilipchanu'
ui.MainForm.on_destroy = gtk.main_quit
ui.MainForm:show_all()

rbArr={ui.rbA, ui.rbB, ui.rbC, ui.rbD, ui.rbE, ui.rbF, ui.rbG, ui.rbH}

function set()
	x=0	
	y=0
	z=0

	if(ui.cbX.active == true)
	then x=1 end
	if(ui.cbY.active == true)
	then y=1 end
	if(ui.cbZ.active == true)
	then z=1 end
	
	value=x+y*2+z*4
	
	rbArr[value+1].active=true;
	ui.labResult.label=value;
end


function ui.cbX:on_clicked(...)
	set()
end

function ui.cbY:on_clicked(...)
	set()
end

function ui.cbZ:on_clicked(...)
	set()
end

gtk.main()
