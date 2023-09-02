extends Button

@export var new_language: String


func _on_button_up() -> void:
	TranslationServer.set_locale(new_language)
