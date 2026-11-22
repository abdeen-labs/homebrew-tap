cask "encore" do
  version "1.0"
  sha256 "f66d2b5522e0f9ca132339612642cc456ecb8dcb2e6c5cc8e615735877f1ecfc"

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
