# date.yazi

Create a file with the current date and an extension.

## Installation

```sh
ya pkg add Aninsi-Sasberg/date
```

## Usage

Add this to your `~/.config/yazi/keymap.toml`:

```toml
[[mgr.prepend_keymap]]
on   = [ "A", "A" ]
run  = "plugin date -- --ext=.txt"
desc = "Create new file with current date and extension"

[[mgr.prepend_keymap]]
on   = [ "A", "D" ]
run  = "plugin date -- --dir"
desc = "Create new empty directory with current date"
```

Note that, the keybindings above are just examples, please tune them up as needed to ensure they don't conflict with your other actions/plugins.

## Acknowlegdement

This plugin was based on diff plugin by [sxyazi]("https://github.com/sxyazi")

## License

This plugin is MIT-licensed. For more information check the [LICENSE](LICENSE) file.
