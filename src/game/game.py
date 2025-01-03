# src/game/main.py
# Import libraries
import pygame
import sys
import os
# Variabels
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
# Ignore pygame mensage
sys.stdout = open(os.devnull, 'w')
#  Initialize Pygame
pygame.init()
# Back console
sys.stdout = sys.__stdout__
# Screen name 
pygame.display.set_caption(NAME)
# Init clock
CLOCK = pygame.time.Clock()
# Init font
pygame.font.init()
FONT = pygame.font.Font(None, 24)
# Draw function
def draw():
    # Color for screen
    SCREEN.fill(BLACK)
    # Display FPS in screen
    fps_text = FONT.render(f"FPS: {int(CLOCK.get_fps())}", True, (WHITE))
    # Display creater in screen
    creator = FONT.render((CREATOR), True, (WHITE))
    # Draw FPS in screen
    SCREEN.blit(fps_text, (TPLEFT))
    # Draw Creator in screen
    SCREEN.blit(creator, (CREATOR_POSITION))
    # Update screen
    pygame.display.update()
    # Clock Tick
    CLOCK.tick(FPS)

# game function
def game():
    # Window is running
    running = True
    # Event loop
    while running:
        # Pygame Events
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
               running = False
        # Execute Draw() Function
        draw()
    # Quit pygame
    pygame.quit()
    print(f"Success : {NAME} is closed")
    sys.exit(0)


# Execute main()    
if __name__ == "__main__":
    game()


