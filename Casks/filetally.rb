cask "filetally" do
  version "1.1.0,1101.1"
  sha256 "8c3cde51ca184a71304c9fb3d7bde9b062d2f3b450577f4c54d16518c2415b63"

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
