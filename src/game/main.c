#include <SFML/Graphics.h>
#include <SFML/Graphics/Color.h>
#include <SFML/Graphics/RenderWindow.h>
#include <SFML/Graphics/Types.h>
#include <SFML/Window/Event.h>
#include <SFML/Window/VideoMode.h>
#include <SFML/Window/WindowBase.h>
#include <complex.h>
int main()
{
  sfVideoMode mode = {800, 600 };
  sfRenderWindow* window;
  sfEvent event;
  window = sfRenderWindow_create(mode, "Pong-better", sfResize | sfClose, NULL);
  while (sfRenderWindow_isOpen(window))
  {
    while (sfRenderWindow_pollEvent(window, &event))
    {
        if (event.type == sfEvtClosed)
            sfRenderWindow_close (window);

    }  
    sfRenderWindow_clear(window, sfBlack);
    sfRenderWindow_display(window);
  }
  sfRenderWindow_destroy(window);
  return 0;
}