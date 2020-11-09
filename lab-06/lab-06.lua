lgi = require 'lgi'
sqlite = require 'lsqlite3'

gtk = lgi.Gtk
gdk = lgi.Gdk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-06.glade')

prov = gtk.CssProvider()
prov:load_from_path('style.css')
ctx=gtk.StyleContext()
scr=gdk.Screen.get_default()
ctx.add_provider_for_screen(scr, prov, gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

ui = bld.objects

ui.MainForm.title = 'lab-06_473_Turubar_Prilipchanu'
ui.MainForm.on_destroy = gtk.main_quit
ui.MainForm:show_all()

rdr_txt = gtk.CellRendererText {xalign=0.5}

emp1 = gtk.TreeViewColumn {title = 'Employee name', 	{rdr_txt, { text = 1 }}	}
emp1:set_alignment(0.5)
ui.employeeTree:append_column(emp1)

lang1 = gtk.TreeViewColumn {title = 'Programming language', 	{rdr_txt, { text = 1 }}	}
lang1:set_alignment(0.5)
ui.languageTree:append_column(lang1)

map1 = gtk.TreeViewColumn {title = 'Employee name', 		{rdr_txt, { text = 1 }}	}
map2 = gtk.TreeViewColumn {title = 'Programming language', 	{rdr_txt, { text = 2 }}	}
map1:set_alignment(0.5)
map2:set_alignment(0.5)
ui.mappingTree:append_column(map1)
ui.mappingTree:append_column(map2)

langCB1 = gtk.TreeViewColumn {title = 'Programming language', 	{rdr_txt, { text = 1 }}	}
langCB1:set_alignment(0.5)
ui.languageTreeCB:append_column(langCB1)

empCB1 = gtk.TreeViewColumn {title = 'Employee name', 	{rdr_txt, { text = 1 }}	}
empCB1:set_alignment(0.5)
ui.employeeTreeCB:append_column(empCB1)

empS1 = gtk.TreeViewColumn {title = 'Employee name', 	{rdr_txt, { text = 1 }}	}
empS1:set_alignment(0.5)
ui.employeeTreeS:append_column(empS1)

mapS1 = gtk.TreeViewColumn {title = 'Employee name', 		{rdr_txt, { text = 1 }}	}
mapS2 = gtk.TreeViewColumn {title = 'Programming language', 	{rdr_txt, { text = 2 }}	}
mapS1:set_alignment(0.5)
mapS2:set_alignment(0.5)
ui.mappingTreeS:append_column(mapS1)
ui.mappingTreeS:append_column(mapS2)

langS1 = gtk.TreeViewColumn {title = 'Programming language', 	{rdr_txt, { text = 1 }}	}
langS1:set_alignment(0.5)
ui.languageTreeS:append_column(langS1)

ui.DatabaseForm.title = 'Database Tables'
function ui.tablesB:on_clicked(...)
	ui.DatabaseForm:show_all()

	db = sqlite.open('lab-06.db')

	for row in db:nrows('SELECT *FROM emptable') do
		el = ui.employeeList:append()
		ui.employeeList[el] = {[1] = row.Name}
	end

	for row in db:nrows('SELECT *FROM langtable') do
		el = ui.languageList:append()
		ui.languageList[el] = {[1] = row.Language}
	end

	for row in db:nrows('SELECT *FROM maptable') do
		el = ui.mappingList:append()
		ui.mappingList[el] = {[1] = row.Name, [2] = row.Language}
	end

	db:close()
end

function ui.closetablesB:on_clicked(...)
	ui.DatabaseForm:hide()
end

ui.EmployeeForm.title = 'Employee Form'
function ui.empB:on_clicked(...)
	ui.EmployeeForm:show_all()
	
	count = 0

	db = sqlite.open('lab-06.db')
	for row in db:nrows('SELECT *FROM emptable') do
		el = ui.CB:append(count, row.Name)
		count = count + 1
	end
	db:close()
end

function ui.CB:on_changed(...)
	if(ui.CB:get_active_text() == '')
	then
	else
		ui.languageListCB:clear()	
	end

	name = ui.CB:get_active_text()

	db = sqlite.open('lab-06.db')
	for row in db:nrows('SELECT *FROM maptable') do
		if (row.Name == name)
		then 
			el = ui.languageListCB:append()
			ui.languageListCB[el] = {[1] = row.Language}
		end
	end
	db:close()
end

function ui.closeemployeeB:on_clicked(...)
	ui.languageListCB:clear()
	ui.CB:remove_all()
	ui.EmployeeForm:hide()
end

ui.LanguageForm.title = 'Language Form'
function ui.lanB:on_clicked(...)
	ui.LanguageForm:show_all()
	
	count = 0

	db = sqlite.open('lab-06.db')
	for row in db:nrows('SELECT *FROM langtable') do
		el = ui.CBL:append(count, row.Language)
		count = count + 1
	end
	db:close()
end

function ui.CBL:on_changed(...)
	if(ui.CBL:get_active_text() == '')
	then
	else
		ui.employeeListCB:clear()	
	end

	language = ui.CBL:get_active_text()

	db = sqlite.open('lab-06.db')
	for row in db:nrows('SELECT *FROM maptable') do
		if (row.Language == language)
		then 
			el = ui.employeeListCB:append()
			ui.employeeListCB[el] = {[1] = row.Name}
		end
	end
	db:close()
end

function ui.closelanguageB:on_clicked(...)
	ui.employeeListCB:clear()
	ui.CBL:remove_all()
	ui.LanguageForm:hide()
end


ui.SearchForm.title = 'Search Form'

function ui.searchB:on_clicked(...)
	ui.SearchForm:show_all()
end


empArray = {}
mapArray = {}
langArray = {}
function ui.searchTB:on_changed(...)
	ui.employeeListS:clear()
	ui.mappingListS:clear()
	ui.languageListS:clear()
	data = ui.searchTB.text
 
	db = sqlite.open('lab-06.db')

	for row in db:nrows('SELECT *FROM emptable') do
		n = string.find(row.Name, data)

		if(n~= nil) 
		then 
			el = ui.employeeListS:append()
			ui.employeeListS[el] = {[1] = row.Name}
		end
	end

	for row in db:nrows('SELECT *FROM maptable') do
		n = string.find(row.Name, data)
		count = 0
		if(n~= nil) 
		then 
			el = ui.mappingListS:append()
			ui.mappingListS[el] = {[1] = row.Name, [2] = row.Language}
			count = 1
		end
		
		if (count == 0) then
			n = string.find(row.Language, data)
			
			if(n~= nil) 
			then 
				el = ui.mappingListS:append()
				ui.mappingListS[el] = {[1] = row.Name, [2] = row.Language}
			end
		end
	end	
	
	for row in db:nrows('SELECT *FROM langtable') do
		n = string.find(row.Language, data)

		if(n~= nil) 
		then 
			el = ui.languageListS:append()
			ui.languageListS[el] = {[1] = row.Language}
		end
	end

	db:close()
	
	if (data == '') 
	then
		ui.employeeListS:clear()
		ui.mappingListS:clear()
		ui.languageListS:clear()
	end
end

function ui.closesearchB:on_clicked(...)
	ui.SearchForm:hide()
end



gtk.main()
