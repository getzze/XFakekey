# XFakekey

Utility to simulate keypresses in X11 from UTF-8 strings.

Written in Vala using C++ code from [Yocto project's libfakekey](https://git.yoctoproject.org/cgit.cgi/libfakekey/).

Does not work in Wayland.

# Building

## Dependencies:

- vala
- meson
- glib2
- gio
- gobject-introspection
- gdk
- gdk-x11
- X11
- XTest

## Build:

    mkdir build && cd $_
    meson ..
    ninja && ninja test && sudo ninja install

