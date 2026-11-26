cask "espalier" do
  version "1.7.2"
  sha256 "fb4baf26a3882665fc21d4b5c4e124b0cd9cb796c5347bdb98d6bf3c989185a4"

  url "https://updates.abdeen.industries/espalier/Espalier-#{version}.dmg"
  name "Espalier"
  desc "Git client"
  homepage "https://espalier.abdeen.dev/"

  livecheck do
    url "https://updates.abdeen.industries/espalier/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :golden_gate

  app "Espalier.app"
  binary "#{appdir}/Espalier.app/Contents/Resources/espalier.sh", target: "espalier"

  zap trash: [
    "~/Library/Application Support/Espalier",
    "~/Library/Caches/dev.abdeen.espalier",
    "~/Library/HTTPStorages/dev.abdeen.espalier",
    "~/Library/Logs/Espalier",
    "~/Library/Preferences/dev.abdeen.espalier.plist",
    "~/Library/Saved Application State/dev.abdeen.espalier.savedState",
  ]
end
