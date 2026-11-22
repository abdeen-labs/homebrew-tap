cask "encore" do
  version "1.1"
  sha256 "3cdebaf487b160df2d6882ffd946af607cc7de047d01138874f7e9f5bdfdd9d9"

  url "https://updates.abdeen.industries/encore/Encore-#{version}.dmg"
  name "Encore"
  desc "Local voice AI: text to speech, voice cloning and transcription"
  homepage "https://github.com/abdeen-labs/encore"

  livecheck do
    url "https://updates.abdeen.industries/encore/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Encore.app"

  uninstall quit: "dev.abdeen.encore"

  zap trash: [
    "~/Library/Application Support/Encore",
    "~/Library/Caches/dev.abdeen.encore",
    "~/Library/HTTPStorages/dev.abdeen.encore",
    "~/Library/Preferences/dev.abdeen.encore.plist",
    "~/Library/Saved Application State/dev.abdeen.encore.savedState",
  ]
end
