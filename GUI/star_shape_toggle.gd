extends Node2D

const SIDE = 32
const HEIGHT = SIDE * sqrt(3)

onready var star = $star
var points: int
var mouse_hover:bool = false

func _input(event):
	if event.is_action_pressed("select") and mouse_hover:
		toggle_sample_stars()

func _ready():
	#defines points of hex-shaped collision polygon
	var p1 = Vector2(-.5 * SIDE, -.5 * HEIGHT)
	var p2 = Vector2(.5 * SIDE, -.5 * HEIGHT)
	var p3 = Vector2(SIDE, 0)
	var p4 = Vector2(.5 * SIDE, .5 * HEIGHT)
	var p5 = Vector2(-.5 * SIDE, .5 * HEIGHT)
	var p6 = Vector2(-1 * SIDE, 0)
	var poly = $hex/CollisionPolygon2D
	poly.polygon = PoolVector2Array([p1, p2, p3, p4, p5, p6])
	poly.rotation_degrees += 30
	
func toggle_sample_stars():
	get_parent().get_parent().reshape_sample_stars(points)


func _on_hover():
	mouse_hover = true
	
	print("hover: " + String(points))

func _on_hover_exited():
	mouse_hover = false
