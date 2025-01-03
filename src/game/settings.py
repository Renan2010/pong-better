# src/game/settings.py
# Import libraries
import pygame
# Name
NAME = "Pong Better"
LAUCHER_NAME = "Pong Better Laucher"
# Text
CREATOR = "Creator: Renan Lucas"
# Screen
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
SCREEN = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT), pygame.SCALED)
# FPS 
FPS = 60
# Colors
BLACK = (0, 0, 0)
WHITE = (255, 255, 255)
RED = (255, 0, 0)
GREEN = (0, 255, 0)
BLUE = (0, 0, 255)
CYAN = (0, 255, 255)
# Position
TPLEFT = (10 , 10)
CREATOR_POSITION = (10 , 25)
# Mouse
PLAY_MOUSE_POS = pygame.mouse.get_pos()
# Laucher Resolution
LAUCHER_SCREEN = "400x300"
# Laucher Color
LWHITE = "white"
