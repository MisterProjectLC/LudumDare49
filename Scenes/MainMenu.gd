extends Control

var flicker = true
var play = true

func _on_Play_button_up():
	play = true
	$AnimationPlayer.play("Blackout")


func _on_Options_button_up():
	if $Options.visible:
		$AnimationPlayer.play("OptionsOpen")
	else:
		if flicker:
			$AnimationPlayer.play("OptionsOpen")
		else:
			$AnimationPlayer.play("OptionsOpenNormal")
	flicker = false


func _on_Quit_button_up():
	play = false
	$AnimationPlayer.play("Blackout")


func _on_Close_button_up():
	$AnimationPlayer.play("OptionsClose")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Blackout":
		if play:
			get_tree().change_scene("res://Scenes/Main.tscn")
		else:
			get_tree().quit()
