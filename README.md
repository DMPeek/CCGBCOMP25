# CCGBCOMP25
Code Crew's Team Project for Gameboy Gamejam 2025

# GB GameJam Design Doc


Puzzle-esque Scenes

Music Jingle Plays
Notes to Catch are displayed (ocarina of time-esque)
Player has to catch the correct notes in order while avoiding the wrong notes
Too Many Wrong Notes -> Game Over -> Retry Level

Levels are part of a Tour
Each Level has a set of 1-5 jingles QUINCY

Scenes
------
GameStart/Logo Scene
Overworld/Tour Scene
Gameplay Scene (3 Levels - 3 backgrounds - Up to 15 Jingles QUINCY)
Game Over Scene

Sprites
------
Player Character - Flute ? QUINCY
Note
Jingle
Bad Note
Car for Overworld (Stretch Goal)

MultiPlayer - STRETCH GOAL
-----
Local Multiplayer mode 
P1 - L/R
P2 - A/B

Link Cable Simulated Online Mode???
4 player?
https://www.youtube.com/watch?v=KtHu693wE9o&ab_channel=stacksmashing

## How to Play

Recommended Emulator - [Visual Boy Advance](https://visualboyadvance.org/)

Download and Install per the directions for your OS

In each of the ___test folders, you will find the .gb rom files along with their source code.

mechanictest contains numerous test scenarios with the .gb file located inside of each numbered folder. Each folder contains a template_minimal folder that contains the .gb file.

audiotest has it's .gb file located inside the src folder

scenetest has it's .gb file located in the obj folder

To run the game on your device, you can open Visual Boy Advance and use the File > Open Game Boy option to navigate to the directory containing the rom file and play it.

On Windows, double clicking the .gb file will open it in the appropriate emulator application.
