extends PanelContainer


func _ready() -> void:
	if OS.has_feature("editor"): #In Editor, For testing
		read_cfg_file("res://project.godot")
		print("//")
		print()
		ProjectSettings.save_custom("res://override.cfg")
		var test = get_test_text()
		$Label.text = test
		
	else: # Final Product, For make the machine run.
		pass
	
	read_cfg_file("res://export_presets.cfg")


func get_test_text() -> String:
	var txt : String = ""
	txt += OS.get_name() + " " + OS.get_version_alias() + "\n"
	txt += "Godot Engine " + Engine.get_version_info().string
	
	return txt



func read_cfg_file(path : String) -> void:
	var cfg = ConfigFile.new()
	if !FileAccess.file_exists(path):
		return
	cfg.load(path)
	for section in cfg.get_sections():
		print("[", section, "]")
		print("")
		for key in cfg.get_section_keys(section):
			prints(key, ":", cfg.get_value(section, key))
		print("")
