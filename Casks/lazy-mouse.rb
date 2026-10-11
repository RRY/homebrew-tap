cask "lazy-mouse" do
  version "1.2"
  sha256 "2b7b3f3836217cf17ef5ce1f44d7c926fe990fb37f1ca77c1aac292df567c689"

  url "https://github.com/RRY/lazy-mouse/releases/download/v#{version}/LazyMouse-#{version}.dmg"
  name "Lazy Mouse"
  desc "HID++ configurator for the Logitech MX Master 3S"
  homepage "https://github.com/RRY/lazy-mouse"

  livecheck do
    url :url
    strategy :github_latest
  end

  # No arch constraint since 1.1: the binary is universal. macOS 14 is the deployment target
  # of the Swift package. A bare symbol, not ">= :sonoma" — Homebrew deprecated the comparison
  # form and reads the symbol as the minimum version.
  depends_on macos: :sonoma

  app "Lazy Mouse.app"

  # The app holds an open connection to the mouse; replacing the bundle underneath a running
  # copy leaves it writing into the void.
  uninstall quit: "com.lazysoftware.lazymouse"

  zap trash: [
    "~/Library/Preferences/com.lazysoftware.lazymouse.plist",
  ]

  caveats <<~EOS
    Lazy Mouse needs Input Monitoring to reach the mouse. Grant it under
      System Settings → Privacy & Security → Input Monitoring
    and restart the app afterwards.

    Keep the app in /Applications: macOS ties the granted permission to its path.
  EOS
end
