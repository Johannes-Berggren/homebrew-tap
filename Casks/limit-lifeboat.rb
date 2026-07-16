cask "limit-lifeboat" do
  version "1.0.2"
  sha256 "da852b4e7be7c08ccf7327c55a0d646776ff5fa3696f1a5e654888ceb5b3309b"

  url "https://github.com/Johannes-Berggren/limit-lifeboat/releases/download/v#{version}/Limit-Lifeboat-#{version}-arm64.dmg",
      verified: "github.com/Johannes-Berggren/limit-lifeboat/"
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
