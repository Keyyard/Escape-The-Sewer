extends Node
var cheese = 0
var score = 0
var hiscore = 0
const SAVE_PATH = "res://savegame.bin"

func _process(delta):
	if score > hiscore:
		hiscore = score
func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"cheese": cheese,
		"hiscore": hiscore,
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	
func loadGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				cheese = current_line["cheese"]
				hiscore = current_line["hiscore"]
