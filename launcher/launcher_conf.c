// ./launcher/laucher_conf.c
// Load libraries
#include <stdio.h>
#include <stdlib.h>
// Main function
int main()
{
    // Define variables
    const char *NAME = "Pong Better";
    const char *LAUNCHER_NAME = "Pong Better Launcher";
    const char *CREATOR = "Creator : Renan Lucas";
    const char *BG_COLOR = "white";
    // Window screen
    int LWIDTH = 500;
    int LHEIGTH = 400;
    // Export variables as environment variables
    setenv("NAME", NAME, 1);
    setenv("LAUNCHER_NAME", LAUNCHER_NAME, 1);
    setenv("CREATOR",CREATOR, 1);
    setenv("BG_COLOR", BG_COLOR, 1);

    char LWIDTH_str[10], LHEIGHT_str[10];
    sprintf(LWIDTH_str, "%d", LWIDTH);
    sprintf(LHEIGHT_str, "%d", LHEIGTH);

    setenv("LWIDTH", LWIDTH_str, 1);
    setenv("LHEIGTH", LHEIGHT_str, 1);

    // Launch the python script
    system("./src/launcher/launcher.so");

    return 0;

}