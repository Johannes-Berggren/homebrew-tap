cask "limit-lifeboat" do
  version "1.1.12"
  sha256 "084e29a3096213eb849f02fdf23402e3c9df236aa3f1941823a2a4b5aafb8911"

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
