#!/bin/bash
gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell --method org.gnome.Shell.Eval 'Main.uiGroup.add_effect(new imports.gi.Clutter.DesaturateEffect());'
