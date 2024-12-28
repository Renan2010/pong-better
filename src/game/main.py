# src/game/main.py
# Import libraries
import pygame
from settings import *
from font import * 
from clock import *
# Screen config
screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
# Screen name
pygame.display.set_caption("Pong Better")
#  Initialize Pygame   
pygame.init()
# Main Loop
running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
    # Color for screen
    screen.fill(WHITE)
    # Display FPS in screen
    fps_text = FONT.render(f"FPS: {int(CLOCK.get_fps())}", True, (BLACK))
    # Draw FPS in screen
    screen.blit(fps_text, (TPLEFT))
    # Update screen
    pygame.display.flip()
    # FPS in screen
    CLOCK.tick(FPS)

pygame.quit()    


