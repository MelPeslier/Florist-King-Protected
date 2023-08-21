extends Node

signal player_enter_room(room_number :int)

signal hugging(is_hugging: bool)

signal player_death(message:String)

signal show_sell_panel(val: bool, price: float)

signal play_the_song(song:String)

signal show_sell_flower_panel(val: bool, price: float)

signal manager_end()
