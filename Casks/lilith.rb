cask "lilith" do
  version "1.0.0"
  sha256 "0f747de2888d0f193f89a806620d13187ce3e9299f1fcccef3d32eb41977dbb7"

  url "https://github.com/ugurgunes95/lilith/releases/download/v#{version}/Lilith-#{version}.zip"
  name "Lilith"
  desc "Keyboard launcher for apps, files, math, conversions and clipboard history"
  homepage "https://github.com/ugurgunes95/lilith"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Lilith.app"

  uninstall quit: "dev.ugurgunes.lilith"

  zap trash: [
    "~/Library/Caches/dev.ugurgunes.lilith",
    "~/Library/HTTPStorages/dev.ugurgunes.lilith",
    "~/Library/Preferences/dev.ugurgunes.lilith.plist",
  ]

  caveats <<~EOS
    Lilith is not notarized by Apple, so macOS blocks the first launch.
    In the warning, click Done (not Move to Trash). Then open
    System Settings > Privacy & Security and click "Open Anyway" next to Lilith.
    Upgrades keep the approval. Details:
      https://github.com/ugurgunes95/lilith#first-launch-apple-could-not-verify-lilith
  EOS
end
