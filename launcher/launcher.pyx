# ./laucher.py
# distutils: language = c++
# Import libraries
import tkinter as tk
import subprocess
import os
import sys
import threading 
# Import variables form the environment
NAME = os.getenv("NAME", "Default Name")
LAUNCHER_NAME = os.getenv("LAUNCHER_NAME", "Default Launcher Name")
CREATOR = os.getenv("CREATOR", "Default Creator")
BG_COLOR = os.getenv("BG_COLOR", "white")
LWIDTH = int(os.getenv("LWIDTH", 500))
LHEIGHT = int(os.getenv("LHEIGHT", 400))
# TK Label
status_label: tk.Label = None
credits_frame: tk.Label = None


# Start game function
def start_game():
    game_path = os.path.join(os.path.dirname(__file__), ".." , "src", "game", "game.py") # ./src/game/game.py 
    try:
        # Print "DEBUG"
        print(f"Initializing : {NAME}")
        # Initialize Pong_better
        os.system(f"python3 {game_path}")
        
    except Exception as e:
        # Printing error
        print(f"Error to initialize : {NAME}")
        sys.exit(1)
# Start thread
def start_game_thread():
    # start
    threading.Thread(target=start_game).start()
# Stop the game
def close_game():
    global game_running

    if game_running and game_running.poll() is None:
        game_running.terminate()
        game_running = None
        status_label.config(text=f"Success : {NAME} is closed", fg="red")
    else:
        status_label.config(text=f"Warwing : {NAME} is not closed" , fg="orange")
        sys.exit(1)

# Create an window Laucher
def window_create():
    # get the screen positions
    pos_x, pos_y = calc_screen()
    # Draw the screen
    LAUNCHER_WINDOW.title(LAUNCHER_NAME)
    LAUNCHER_WINDOW.geometry(f"{LWIDTH}x{LHEIGHT}+{pos_x}+{pos_y}")
    LAUNCHER_WINDOW.configure(bg=BG_COLOR)
    

# Calculate screen position
def calc_screen():
    # Get the dimendions of the screen
    screen_width = LAUNCHER_WINDOW.winfo_screenwidth()
    screen_height = LAUNCHER_WINDOW.winfo_screenheight()
    # Calculate the position to center the window
    pos_x = (screen_width // 2) - (LWIDTH // 2)
    pos_y = (screen_height // 2) - (LHEIGHT // 2)
    # Return the calculated positions
    return pos_x, pos_y

# Title style
def title_style():
    title = tk.Label(LAUNCHER_WINDOW, text=LAUNCHER_NAME, font=(None, 24), bg=BG_COLOR)
    title.pack(pady=50)
# Options button
def options_button():
    options_button = tk.Button(LAUNCHER_WINDOW, text=f"Options", font=(None, 14), command=options_show)
    options_button.pack(pady=10)
# Options screen
def options_show():
    main_frame = tk.Frame(LAUNCHER_WINDOW)
    main_frame.pack_forget()
    credits_frame.pack(padx=20, pady=20)
# Credits button
def credits_button():
    options_button = tk.Button(LAUNCHER_WINDOW, text="Credits", font=(None, 14), command=credits_show)
    options_button.pack(pady=10)
# Credits
def credits_show():
    pass
# Start game button
def start_game_button():
    start_game_button = tk.Button(LAUNCHER_WINDOW, text=f"Start {NAME}", font=(None, 14), command=start_game_thread)
    start_game_button.pack(pady=20)
# Status
# status_label = tk.Label
# run laucher loop and functions
LAUNCHER_WINDOW = tk.Tk()
calc_screen()
window_create()
tk.Label(LAUNCHER_WINDOW, text=CREATOR).pack()
title_style()
start_game_button()
options_button()
credits_button()
# laucher Loop
LAUNCHER_WINDOW.mainloop()

