# Battlestations

A collection of scripts to put your battle station into an appropriate color scheme. Requires Gnome Shell.

Best combined with an IoT command to switch to red lighting and appropriate sound effects.

Greyscale mode can be useful when handling memetic hazards like the McCollough effect.

## Usage

`colorize.sh` is the main script, the rest are leftovers from development.

* Call it without parameters to clear effects
* Call it with a color name (e.g. `./colorize.sh '#0f0'` - don't forget to quote/escape hex codes containing #)
* Setting the color to `white` results in an effect equivalent to `desat.sh` (greyscale display)


## Helpful snippets

### Restart Gnome

<kbd>Alt</kbd>+<kbd>F2</kbd> `r` <kbd>Enter</kbd>

Useful when you've accidentally blacked out your screen with the wrong effect...

### Looking Glass

<kbd>Alt</kbd>+<kbd>F2</kbd> `lg` <kbd>Enter</kbd>

or

    gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell --method org.gnome.Shell.Eval 'Main.lookingGlass.toggle();'

### Effects

Looking glass or JS/extension:

    // Likely not needed in Looking Glass
    const Clutter = imports.gi.Clutter;
    const Main = imports.ui.main;

    // You may want to use "const e" in an extension
    e = new Clutter.DesaturateEffect();
    Main.uiGroup.add_effect(e);
    Main.uiGroup.remove_effect(e);

    col = new imports.gi.Clutter.ColorizeEffect();
    red = Clutter.Color.from_string("#ff0000")[1];
    col.set_tint(red);
    Main.uiGroup.add_effect(col);

    Main.uiGroup.clear_effects();

or shell:

    gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell --method org.gnome.Shell.Eval 'Main.uiGroup.add_effect(new imports.gi.Clutter.DesaturateEffect());'

    gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell --method org.gnome.Shell.Eval "Main.uiGroup.clear_effects(); const e = new imports.gi.Clutter.ColorizeEffect(); const c = imports.gi.Clutter.Color.from_string('#0f0'); if (c[0]) { e.set_tint(c[1]); Main.uiGroup.add_effect(e); }"

### Clear effects

Looking Glass:

    Main.uiGroup.clear_effects()

Shell:

    gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell --method org.gnome.Shell.Eval 'Main.uiGroup.clear_effects();'


## Worth looking into

#### Shader effects! 

* https://developer.gnome.org/cluttermm/unstable/classClutter_1_1ShaderEffect.html
* https://learnopengl.com/Getting-started/Shaders
* https://developer.gnome.org/clutter/unstable/ClutterShaderEffect.html

Started working on this but couldn't get it to work. May not be possible without subclassing ClutterShaderEffect.

## Sound effect sources

* [EAM alert tone](https://www.youtube.com/watch?v=HWZXinRwCaE): 900 Hz and 1100 Hz square wave alternating every 230 ms
* [General alarm high quality](https://www.youtube.com/watch?v=SUbFk1qUVTw)
* [GQ exercise with announcement](https://www.youtube.com/watch?v=ZSYtFpbhfsE)
* [EAM content](https://www.youtube.com/watch?v=o3Fe4qnaSx4)

## License

Penta-licensed under Public Domain, CC0, MIT, WTFPL, Apache v2 (in plaintext: do whatever you want with this).

(c) 2020 Jan Schejbal

By contributing to this repository you agree to license your code under the same terms.
