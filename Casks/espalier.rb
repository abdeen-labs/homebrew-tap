cask "espalier" do
  version "1.6"
  sha256 "80da9fadb5a0cc48475ee9706b17f5f63d32b37846548b1b7d1192586ebb9c3e"

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
