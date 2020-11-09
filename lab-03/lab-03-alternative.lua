lgi = require 'lgi'

gtk = lgi.Gtk
gdk = lgi.Gdk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-03-alternative.glade')

prov = gtk.CssProvider()
prov:load_from_path('style-alternative.css')
ctx=gtk.StyleContext()
scr=gdk.Screen.get_default()
ctx.add_provider_for_screen(scr, prov, gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

ui = bld.objects

ui.MainForm.title = 'lab-03-alternative_473_Turubar_Prilipchanu'
ui.MainForm.on_destroy = gtk.main_quit
ui.MainForm:show_all()

--function ui.TB:on_key_press_event(...)
	--if(ui.TB.text=="нет значения")
	--then ui.labelResult.label="0"
	--else ui.labelResult.label="нет значения"	
	--end 
--end

cb={ui.cbA, ui.cbB, ui.cbC, ui.cbD}

function ui.TB:on_changed(...)
	if (type(tonumber(ui.TB.text))=='number')
	then
		num = tonumber(ui.TB.text)
		f=0
		if(num>15) then 
			num=15
			f=f+1 
		end
		
		s=""
		
		if(num>=8) then 
			cb[1].active=true 
			num=num-8
			s=s.."1"
		else 
			cb[1].active=false
			s=s.."0"
		end
		if(num>=4) then 
			cb[2].active=true 
			num=num-4
			s=s.."1"
		else 
			cb[2].active=false
			s=s.."0"
		end
		if(num>=2) then 
			cb[3].active=true 
			num=num-2
			s=s.."1"
		else 
			cb[3].active=false
			s=s.."0"
		end
		if(num>=1) then 
			cb[4].active=true 
			num=num-1
			s=s.."1"
		else 
			cb[4].active=false
			s=s.."0"	
		end

		if(f==0)
		then
			ui.labelResult.label=s
		else
			ui.labelResult.label="1111"
			ui.TB.text="15"
		end
	else
		ui.labelResult.label="nope!"
		cb[1].active=false;
		cb[2].active=false;
		cb[3].active=false;
		cb[4].active=false;
	end 
	
end

gtk.main()
