cask "encore" do
  version "1.2"
  sha256 "44849f73ca67da9ff11ec09eb9caa9d07eda7888589b7959eb6288801c2a0204"

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
