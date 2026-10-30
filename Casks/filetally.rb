cask "filetally" do
  version "1.0.0,1028.2"
  sha256 "44db3d9308cea6634979f322862fdadd030394a37da57f0f4957fd866c34bca7"

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
