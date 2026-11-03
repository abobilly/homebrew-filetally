cask "filetally" do
  version "1.1.1,1102.2"
  sha256 "6b1f66f6c86bd66c31b20696b5d0f0a6e26db1f4714470bcdabdc31d0cfbb309"

  url "https://filetally.com/downloads/mac/#{version.csv.first}-#{version.csv.second}/FileTally-#{version.csv.first}-#{version.csv.second}-mac.zip"
  name "FileTally"
  desc "Local page and file counter for document collections"
  homepage "https://filetally.com/"

  livecheck do
    url "https://filetally.com/downloads"
    regex(%r{/downloads/mac/v?(\d+(?:\.\d+)+)-(\d+(?:\.\d+)+)/FileTally[._-]}i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| "#{match[0]},#{match[1]}" }
    end
  end

  depends_on macos: :sonoma

  app "FileTally.app"

  # No zap stanza: licenses, trial history and saved scans must survive uninstall.
end
