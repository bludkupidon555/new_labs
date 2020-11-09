lgi = require 'lgi'

gtk = lgi.Gtk
gdk = lgi.Gdk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-02.glade')

prov = gtk.CssProvider()
prov:load_from_path('style.css')-- оказалось что не нужно указывать путь к файлу, т.к. все находится в одной папке -10 мин времени

ctx=gtk.StyleContext()
scr=gdk.Screen.get_default()
ctx.add_provider_for_screen(scr, prov, gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)-- вместо того чтобы писать scr, писал src; пришлось  гуглить и читать документацию к методам на английском языке -45 мин времен

ui = bld.objects

ui.MainForm.title = 'lab-02_473_Turubar_Prilipchanu'-- заголовок формы
ui.MainForm.on_destroy = gtk.main_quit
ui.MainForm:show_all()

function ui.AddB:on_clicked(...)-- функция сложения A и B
	if (type(tonumber(ui.NumberA.text))=='number' and type(tonumber(ui.NumberB.text))=='number')-- проверка на ввод строки
	then 
		a=tonumber(ui.NumberA.text)
		b=tonumber(ui.NumberB.text)
		ui.ResultTB.label = a+b;
	else
		ui.ResultTB.label = "x_X_x_Error_x_X_x";
	end
end

function ui.SubbtractB:on_clicked(...)-- функция разности A и B
	if (type(tonumber(ui.NumberA.text))=='number' and type(tonumber(ui.NumberB.text))=='number')-- проверка на ввод строки 
	then 
		a=tonumber(ui.NumberA.text)
		b=tonumber(ui.NumberB.text)
		ui.ResultTB.label = a-b;
	else
		ui.ResultTB.label = "x_X_x_Error_x_X_x";
	end
end

function ui.MultiplyB:on_clicked(...)-- функция умножения A и B
	if (type(tonumber(ui.NumberA.text))=='number' and type(tonumber(ui.NumberB.text))=='number')-- проверка на ввод строки
	then 
		a=tonumber(ui.NumberA.text)
		b=tonumber(ui.NumberB.text)
		ui.ResultTB.label = a*b;
	else
		ui.ResultTB.label = "x_X_x_Error_x_X_x";
	end
end

function ui.DivideB:on_clicked(...)-- функция деления A и B
	if (type(tonumber(ui.NumberA.text))=='number' and type(tonumber(ui.NumberB.text))=='number')-- проверка на ввод строки
	then 
		a=tonumber(ui.NumberA.text)
		b=tonumber(ui.NumberB.text)
		if(b==0)-- проверка на ноль в знаменателе(B)
		then
			ui.ResultTB.label = "x_X_x_Error_x_X_x";
		else
			ui.ResultTB.label = a/b;
		end
	else
		ui.ResultTB.label = "x_X_x_Error_x_X_x";
	end
end

function ui.sinB:on_clicked(...)-- функция нахождения значения синуса введенного угла

	if (type(tonumber(ui.NumberA.text))=='number')-- проверка на ввод строки
	then 
		a=math.sin(math.rad(tonumber(ui.NumberA.text)));-- перевод угла в радианы и получение значения синуса
		ui.ResultTB.label = a;
	else
		ui.ResultTB.label = "x_X_x_Error_x_X_x";
	end

end

function ui.cosB:on_clicked(...)-- функция нахождения значения косинуса введенного угла

	if (type(tonumber(ui.NumberA.text))=='number')-- проверка на ввод строки
	then 
		a=math.cos(math.rad(tonumber(ui.NumberA.text)));-- перевод угла в радианы и получение значения косинуса
		ui.ResultTB.label = a;
	else
		ui.ResultTB.label = "x_X_x_Error_x_X_x";
	end

end

function ui.tgB:on_clicked(...)-- функция нахождения значения тангенса введенного угла

	if (type(tonumber(ui.NumberA.text))=='number')-- проверка на ввод строки
	then 
		a=math.tan(math.rad(tonumber(ui.NumberA.text)));-- перевод угла в радианы и получение значения тангенса
		ui.ResultTB.label = a;
	else
		ui.ResultTB.label = "x_X_x_Error_x_X_x";
	end

end

function ui.ctgB:on_clicked(...)-- функция нахождения значения котангенса введенного угла

	if (type(tonumber(ui.NumberA.text))=='number')
	then 
		a=math.cos(math.rad(tonumber(ui.NumberA.text)))/math.sin(math.rad(tonumber(ui.NumberA.text)));-- деление косинуса на синус с перевод угла в радианы
		ui.ResultTB.label = a;
	else
		ui.ResultTB.label = "x_X_x_Error_x_X_x";
	end

end

function ui.msB:on_clicked(...)-- функция записи значения из "дисплея" в "память"
	ui.MemoryTB.label = ui.ResultTB.label;-- из Result => Memory
end

function ui.mrB:on_clicked(...)-- функция вывода значения из памяти на "дисплей"
	ui.ResultTB.label = ui.MemoryTB.label;-- из Memory => Result
end

function ui.rcB:on_clicked(...)-- функция очистки "дисплея"
	ui.ResultTB.label = 0;-- Result clear
end

function ui.mcB:on_clicked(...)-- функция очистки "памяти"
	ui.MemoryTB.label = 0;-- Memory clear
end

function ui.mmB:on_clicked(...)-- функция разности значений "дисплея" и "памяти"
	ui.ResultTB.label = ui.ResultTB.label - ui.MemoryTB.label;-- Result - Memory
end

function ui.mpB:on_clicked(...)-- функция суммы значений "дисплея" и "памяти"
	ui.ResultTB.label = ui.ResultTB.label + ui.MemoryTB.label;-- Result + Memory
end

gtk.main()


	


