cask "espalier" do
  version "1.7.5"
  sha256 "8165204c0aaef1008e6d82e883dc60c502f915bafe20ee6ce1d2ce4ddc925501"

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
