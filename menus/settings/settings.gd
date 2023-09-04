extends Control


@onready var settings_languages: Control = $MarginContainer/VBoxContainer/SplitScreen/ValuesMargin/SettingsLanguages


func _ready() -> void:
	visible = false


func _on_languages_button_up() -> void:
	settings_languages.visible = !settings_languages.visible


func _on_back_button_up() -> void:
	visible = false
