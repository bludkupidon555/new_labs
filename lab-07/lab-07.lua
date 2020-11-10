lgi = require 'lgi'

gtk = lgi.Gtk
cairo = lgi.cairo

gtk.init()

local wnd = gtk.Window
{
	title = 'lab-07_Turubar_Prilipchanu',
	default_width = 256,
	default_height = 256,
	on_delete_event = gtk.main_quit		,
	gtk.Box
	{
		border_width = 4,
		spacing = 4,
		orientation = 'VERTICAL',
		gtk.DrawingArea
		{
			expand = true,
			id = 'pb',
			width = 256,
			height = 256
		},
		
		gtk.Box
		{
			orientation = 'HORIZONTAL',
			spacing = 4,
			gtk.Button
			{
				id = 'butA',
				label = 'A'
			},

			gtk.Button
			{
				id = 'butB',
				label = 'B'
			}
		}
	}
}

local pb = wnd.child.pb
local butA = wnd.child.butA
local butB = wnd.child.butB


r = 1
g = 1
b = 1

function pb:on_draw(e)
	e:set_source_rgb(1, 1, 1)
	e:paint()

	for x = 1, 10 do
		for y = 1, 10 do
			e:set_source_rgb(x/10 * r, y/10 * g, 0.75 * b)
			e:rectangle(x*15, y*15, 10, 10)
			e:fill()
		end
	end
	
	return true
end

function butA:on_clicked(...)
	r = 1
	g = 1
	b = 1

	pb:queue_draw()
end

function butB:on_clicked(...)
	r = 0.7
	g = 0.5
	b = 0.6
	pb:queue_draw()
end


wnd:show_all()

gtk.main()
