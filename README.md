# Introduction
This project is intended to demonstrate a bug with `MultiplayerSynchronizer` nodes in Godot 4.3, specifically related to `CharacterBody3D` nodes and changing node authority. The bug involves having multiple "Players" spawning into a game. When a second player node is spawned into a scene and the authority of the new player node is changed, the new node will erroneously inherit the position of the last player spawned if the players are both `CharacterBody3D` nodes using `move_and_slide()` every physics frame. This bug does not occur if the nodes are not specifically using `move_and_slide()`, and instead are setting their positions manually per frame.

# Instructions
- 1. Clone the repo
- 2. Import the `project.godot` file into the Godot editor (version `4.3.stable`)
- 3. Under `Debug->Custom Run Instances...` enable `Enable Multiple Instances` and set the instance count to 2.
- 4. Launch the demo using `Run Project` (F5)
- 5. In one window, press "Host Server" and use WASD or Arrow Keys to move the character around.
- 6. In the other window, press "Connect to Server"

Depending on whether `move_and_slide` is being used, the newly spawned player will or will not spawn on top of the host player.

In order to turn off `move_and_slide` to visualize the exact same setup with no physics, toggle comments on likes 13-15 in `player.gd` and toggle comments off of lines 17-18.
