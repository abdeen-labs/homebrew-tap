cask "espalier" do
  version "1.7.4"
  sha256 "74eade381ad72f58ba7e1e1d49cdee313f188acb31e6def1f19871952be2edcf"

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
