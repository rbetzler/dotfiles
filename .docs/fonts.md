## Adding a custom font

1. Create fonts directory
    ```bash
    mkdir -p ~/.local/share/fonts
    ```
2. Download a font, likely from https://fonts.google.com/
3. Unzip
    ```bash
    unzip MyFont.zip
    ```
4. Move the `.ttf` file to `~/.local/share/fonts/`
5. Reload font cache
    ```bash
    fc-cache -f -v
    ```
