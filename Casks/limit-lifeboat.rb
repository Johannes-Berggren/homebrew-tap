cask "limit-lifeboat" do
  version "1.0.3"
  sha256 "b526d0a52295f5ebed62b5937c4de0dd4fb276fa65d0f16e462054f263f1043e"

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
