# src/game/main.py
# Import libraries
import pygame
import sys
from settings import *
from font import * 
from clock import *
# Screen name 
pygame.display.set_caption(NAME)
#  Initialize Pygame   
pygame.init()
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

# Main function
def main():
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
    sys.exit()

# Execute main()    
if __name__ == "__main__":
    main()


