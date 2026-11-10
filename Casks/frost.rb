cask "frost" do
  version "2.2.3"
  sha256 "0d3f7f682a69d742b273a343b671b971a5945db638999ffd74ec003e36c4ef6e"

  url "https://github.com/abdeen-labs/frost/releases/download/v#{version}/Frost-#{version}.dmg",
      verified: "github.com/abdeen-labs/frost/"
  name "Frost"
  desc "Menu bar app that blocks keyboard, mouse and trackpad input"
  homepage "https://abdeen.dev/frost"

  livecheck do
    url "https://updates.abdeen.industries/frost/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Frost.app"

  uninstall quit: "dev.abdeen.frost"

  zap trash: [
    "~/Library/Caches/dev.abdeen.frost",
    "~/Library/HTTPStorages/dev.abdeen.frost",
    "~/Library/Preferences/dev.abdeen.frost.plist",
  ]
end
