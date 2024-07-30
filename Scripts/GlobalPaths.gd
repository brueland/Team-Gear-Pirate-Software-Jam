# GlobalPaths.gd
extends Node

# SCENES
# SCENES/MC
const GRAPPLING_HOOK_PATH: String = "res://Scenes/Player/GrapplingHook.tscn"
# SCENES/ENEMIES/GHOST
const GHOST_PATH: String = "res://Scenes/Enemies/Ghost/Ghost.tscn"
# SCENES/ITEMS/LANTERN
const LANTERN_PATH: String = "res://Scenes/Items/Lantern/Lantern.tscn"

# SCENES/UI
const MAIN_MENU_SCREEN_PATH: String = "res://Scenes/UI/Main_Menu.tscn"
const DEATH_SCREEN_PATH: String = "res://Scenes/UI/death_ui.tscn"
const OPTIONS_SCREEN_PATH: String = "res://Scenes/UI/Main_Menu_Options.tscn"
const END_GAME_SCENE_PATH: String = "res://Scenes/UI/endGame.tscn"
# SCENES/LEVELS
# SCENES/LEVELS/PRISON
const PRISON_SCENE_PATH: String = "res://Scenes/Levels/Prison/prison.tscn"
# SCENES/LEVELS/DREAMSCENE
const DREAM_SCENE_PATH: String = "res://Scenes/Levels/DreamSequences/DashDreamSequence.tscn"

# SCENES/LEVELS/SBX
const SBX_MAIN_SCENE_PATH: String = "res://Scenes/Levels/SBX/sbx_main.tscn"
const SBX_SCENE_1_PATH: String = "res://Scenes/Levels/SBX/sbx_room_1.tscn"
const SBX_SCENE_2_PATH: String = "res://Scenes/Levels/SBX/sbx_room_2.tscn"

# SCENES/LEVELS/LAB
const LAB_MAIN_PATH: String = "res://Scenes/Levels/Lab/LabMain.tscn"

# SCENES/LEVELS/LAB/Archaeology
const ARCH1_PATH: String = "res://Scenes/Levels/Lab/Archaeology/Arch1.tscn"
const ARCH2_PATH: String = "res://Scenes/Levels/Lab/Archaeology/Arch2.tscn"

# SCENES/LEVELS/LAB/BioEng
const BIO1_PATH: String = "res://Scenes/Levels/Lab/BioEng/BioEng1.tscn"
const BIO2_PATH: String = "res://Scenes/Levels/Lab/BioEng/BioEng2.tscn"

# SCENES/LEVELS/LAB/Chemistry
const CHEM1_PATH: String = "res://Scenes/Levels/Lab/Chemistry/Chem1.tscn"
const CHEM2_PATH: String = "res://Scenes/Levels/Lab/Chemistry/Chem2.tscn"

# SCENES/LEVELS/LAB/Secret
const SECRET1_PATH: String = "res://Scenes/Levels/Lab/SecretRoom/Secret1.tscn"
const SECRET2_PATH: String = "res://Scenes/Levels/Lab/SecretRoom/Secret2.tscn"

# SCENES/LEVELS/LAB/Forest
const FOREST1_PATH: String = "res://Scenes/Levels/Lab/Forest/Forest1.tscn"
const FOREST2_PATH: String = "res://Scenes/Levels/Lab/Forest/Forest2.tscn"

# ASSETS
# ASSETS/SPRITES
# ASSETS/SPRITES/LANTURN
const LANTURN_EMPTY_PATH: String = "res://Assets/Sprites/Lanturn/lanturn_empty.png"
const LANTURN_FULL_PATH: String = "res://Assets/Sprites/Lanturn/lanturn_full.png"
const LANTURN_ANIMATION_PATH: String = "res://Assets/Sprites/Lanturn/lanturn_animation.png"

# ASSETS/SPRITES/MC
const PLAYER_AIM_PATH: String = "res://Assets/Sprites/Grapple/Aim.png"
const PLAYER_AIMING_PATH: String = "res://Assets/Sprites/Grapple/Aiming.png"

const DASH_UPGRADE: String = "res://Scenes/Items/fragment_piece.tscn"

#AUDIO BUSES
const AUDIO_BUS_LAYOUT = "res://Layouts/default_bus_layout.tres"
const MASTER_BUS :String = &"Master"
const BGM_BUS : String = &"BGM"
const SFX_BUS : String = &"SFX"
const MASTER_BUS_INDEX : int = 0
const SFX_BUS_INDEX : int = 1
const BGM_BUS_INDEX : int = 2
