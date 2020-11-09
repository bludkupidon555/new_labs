lgi = require 'lgi'

gdk = lgi.Gdk

gtk = lgi.Gtk
picture = lgi.GdkPixbuf.Pixbuf

gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-04.glade')

prov = gtk.CssProvider()
prov:load_from_path('style.css')
ctx=gtk.StyleContext()
scr=gdk.Screen.get_default()
ctx.add_provider_for_screen(scr, prov, gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

ui = bld.objects

ui.MainForm.title = 'lab-04_473_Turubar_Prilipchanu'
ui.MainForm.on_destroy = gtk.main_quit
ui.MainForm:show_all()

rdr_txt = gtk.CellRendererText {xalign=0.5}
rdr_pix = gtk.CellRendererPixbuf {}

c1 = gtk.TreeViewColumn {title = 'Name',         {rdr_txt, {text = 1  }}	}	
c2 = gtk.TreeViewColumn {title = 'Count',        {rdr_txt, {text = 2  }}	}
c3 = gtk.TreeViewColumn {title = 'Price',        {rdr_txt, {text = 3  }}	}
c4 = gtk.TreeViewColumn {title = 'Total price',  {rdr_txt, {text = 4  }}	}
c5 = gtk.TreeViewColumn {title = 'Picture',      {rdr_pix, {pixbuf = 5  }}	}
c1:set_min_width(100)
c1:set_alignment(0.5)
c2:set_min_width(100)
c2:set_alignment(0.5)
c3:set_min_width(100)
c3:set_alignment(0.5)
c4:set_min_width(100)
c4:set_alignment(0.5)
c5:set_min_width(100)
c5:set_alignment(0.5)
ui.dataTree:append_column(c1)
ui.dataTree:append_column(c2)
ui.dataTree:append_column(c3)
ui.dataTree:append_column(c4)
ui.dataTree:append_column(c5)

rbArr = {ui.rbApple, ui.rbBlueberry, ui.rbCherry, ui.rbGrapes, ui.rbLemon, ui.rbOrange, ui.rbPear, ui.rbRaspberry, ui.rbStrawberry}

imgArr = {picture.new_from_file("Apple.png"), picture.new_from_file("Blueberry.png"), picture.new_from_file("Cherry.png"), picture.new_from_file("Grapes.png"), picture.new_from_file("Lemon.png"), picture.new_from_file("Orange.png"), picture.new_from_file("Pear.png"), picture.new_from_file("Raspberry.png"), picture.new_from_file("Strawberry.png"),}

function dataload()
	readstr = {}
	count = 0
	buys = io.open("products.txt", "r")
	for i in buys:lines() do
		readstr[count] = tostring(i)
		splitarr = {}

		index = 1
		for s in string.gmatch(readstr[count], "%S+") do
			splitarr[index] = s
			index = index + 1
		end
		
		name = splitarr[1]
		count = splitarr[2]
		price = splitarr[3]
		total = splitarr[4]
		n = splitarr[5]
		px = imgArr[math.floor(n)]
		
		i = ui.dataList:append() 
		ui.dataList[i] = {[1] = name, [2] = count, [3] = price, [4] = total, [5] = px}

		count = count + 1
	end
	buys:close()
	
end

function ui.loadB:on_clicked()
	dataload()
end

function ui.addB:on_clicked(...) -- Нажатие на кнопку "Add"
	s =protectAddB() -- Функция выполняющая роль защиты от дурака; проверка на пустоту и корректность вводимых данных
	if (s~='') then return end

	c=-1

	for s in string.gmatch(ui.nameTB.text, "%S+") do
		c = c + 1
	end
	
	if(c>0) 
	then
		ui.stateL.label = 'State: Spaces are not allowed!'
		return 
	end	

	ui.stateL.label = 'State: OK!' -- Все зае**сь получаеца

	name = ui.nameTB.text
	count = tonumber(ui.countTB.text)
	price = tonumber(ui.priceTB.text)
	total = price * count
	file =''
	px=0
	for i = 1, 9, 1 do
		if(rbArr[i].active==true) 
		then
			file = rbArr[i].label..'.png'
			px = imgArr[i]

			i = ui.dataList:append() 
			ui.dataList[i] = {[1] = name, [2] = count, [3] = price, [4] = total, [5] = px}
		end
	end
	
end

function ui.saveB:on_clicked(...)
	
	arrstr = {} -- массив всех строк из liststore
	arrcolumns = {} -- массив для колон одной строки, нужен чтобы собрать из всех колонок целую строку. Уметь бы нормально пользоваться метатаблицами 
	
	iter = ui.dataList:get_iter_first() -- первый итератор	
	count = 0

while iter~=nil do
	for i = 0, 4, 1 do
		values = ui.dataList:get_value(iter, i)
		if (i==4) then
			for j = 1, 9, 1 do
				pb1 = tostring(imgArr[j])
				pb2 = tostring(values.value)
		
				if(pb1==pb2) then
					arrcolumns[i] = j
				end
			end	
		else
			arrcolumns[i] = values.value
			
		end
	end
	
	if(type(tonumber(arrcolumns[0]))=='number') then math.floor(arrcolumns[0]) end

	arrstr[count] = arrcolumns[0].." "..math.floor(arrcolumns[1]).." "..math.floor(arrcolumns[2]).." "..math.floor(arrcolumns[3]).." "..arrcolumns[4]..'\n'
	
	ui.dataList:remove(iter)
	iter = ui.dataList:get_iter_first()
	count=count+1
end
	buys = io.open("products.txt", "w")
	for i = 0 , count-1, 1 do
		buys:write(arrstr[i])
	end
	buys:close()
	dataload()
end

function ui.delB:on_clicked(...)
	ui.sel=ui.dataTree:get_selection()
	model, iter = ui.sel:get_selected()
	ui.dataList:remove(iter)
end

function ui.clearB:on_clicked(...)
	ui.dataList:clear()
end

function protectAddB()
	if(protectName() == '') then 
	else 
		ui.stateL.label = 'State: '..protectName()
		return 
	end

	if(protectCount() == '') then 
	else 
		ui.stateL.label = 'State: '..protectCount()
		return 
	end
	
	if(protectPrice() == '') then 
	else 
		ui.stateL.label = 'State: '..protectPrice()
		return 
	end
	return ''
end

function protectName()

	if (ui.nameTB.text == '') then return 'Field (Name) is empty'
	else
		return '' end
end

function protectCount()

	if (ui.countTB.text == '') then return 'Field (Count) is empty'
	elseif (type(tonumber(ui.countTB.text))~='number') then return 'Field (Count) is not correct'
	else 
		return '' end
end

function protectPrice()

	if (ui.priceTB.text == '') then return 'Field (Price) is empty'
	elseif (type(tonumber(ui.priceTB.text))~='number') then return 'Field (Price) is not correct'
	else 
		return '' end
end

gtk.main()
