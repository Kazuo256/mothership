class_name Debug extends Label3D

var info := {}

func _process(_delta):
	text = ""
	for key in info:
		var value = info[key]
		if value is float:
			text += "%8s: %.2f\n" % [key, value]
		else:
			text += "%8s: %s\n" % [key, value]
	info.clear()

func set_info(key, value) -> Debug:
	info[key] = value
	return self
