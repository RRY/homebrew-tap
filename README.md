# RRY/tap

Homebrew tap for my own macOS software.

```
brew tap RRY/tap
brew trust rry/tap
brew install --cask lazy-mouse
```

The `brew trust` step is not optional. Since Homebrew 6 a cask from a third-party tap is
refused with *"Refusing to load cask … from untrusted tap"* until the tap is trusted
explicitly — a cask is Ruby that Homebrew executes, so it wants a deliberate decision rather
than an implicit one. To limit the trust to a single cask:

```
brew trust --cask rry/tap/lazy-mouse
```

## Casks

| Cask | Description |
|---|---|
| [`lazy-mouse`](Casks/lazy-mouse.rb) | HID++ configurator for the Logitech MX Master 3S — [source](https://github.com/RRY/lazy-mouse) |

Universal binary (Apple silicon and Intel), macOS 14 or newer. The app is signed with a Developer ID and notarized.
