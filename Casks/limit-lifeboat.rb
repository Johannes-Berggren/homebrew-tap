cask "limit-lifeboat" do
  version "1.1.13"
  sha256 "479e4725eb99609897e9908186696d4a5ed06f1a1a434aeff2f7f1a9460bd37f"

  url "https://github.com/Johannes-Berggren/limit-lifeboat/releases/download/v#{version}/Limit-Lifeboat-#{version}-arm64.dmg"
  name "Limit Lifeboat"
  desc "Monitor and switch between AI coding subscription accounts"
  homepage "https://limitlifeboat.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Limit Lifeboat.app"

  uninstall quit: "com.limitlifeboat.app"

  zap trash: [
    "~/Library/Application Support/.LimitLifeboatMigration-v1-stage",
    "~/Library/Application Support/.LimitLifeboatMigration-v1.json",
    "~/Library/Application Support/.LimitLifeboatMigration-v1.lock",
    "~/Library/Application Support/LimitLifeboat",
    "~/Library/Application Support/LLMUsageMonitor",
    "~/Library/Preferences/com.johannesberggren.LLMUsageMonitor.plist",
    "~/Library/Preferences/com.limitlifeboat.app.plist",
  ]
end
