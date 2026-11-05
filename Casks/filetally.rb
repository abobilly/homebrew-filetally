cask "filetally" do
  version "1.2.0,1105.2"
  sha256 "0888c1e5978831d0f65eea48444dfd805ccaa58a7cc90937c9033f35e59eb894"

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
