extends Node3D

var player_scene = preload("res://PlayerScene.tscn")

var peer = ENetMultiplayerPeer.new()
@onready var playerspawner: MultiplayerSpawner = $MultiplayerSpawner

func start_server():
	peer.create_server(8613, 3)
	multiplayer.multiplayer_peer = peer
	var newplayer = spawn_player()

func connect_to_server():
	peer.create_client("localhost", 8613)
	multiplayer.multiplayer_peer = peer
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _ready() -> void:
	$MultiplayerSpawner.spawn_function = custom_spawn
	multiplayer.peer_connected.connect(spawn_player)

func spawn_player(id = 1):
	print("SPAWNING PLAYER")
	var newplayer = playerspawner.spawn({
		"authority": id,
		"name": str(randi()),
		"position": Vector3()
	})


func custom_spawn(data: Dictionary) -> Node:
	var newplayer = player_scene.instantiate()

	if "authority" in data:
		newplayer.authority = data["authority"]
	if "position" in data:
		newplayer.position = data["position"]
	if "name" in data:
		newplayer.name = data["name"]

	return newplayer
