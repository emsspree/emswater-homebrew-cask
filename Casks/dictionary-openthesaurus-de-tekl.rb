cask "dictionary-openthesaurus-de-tekl" do
  version "2024.05.14"
  sha256 :no_check

  name "OpenThesaurus Deutsch"
  desc "German thesaurus: OpenThesaurus.de for Dictionary.app"
  url "https://github.com/Tekl/openthesaurus-deutsch/releases/download/v#{version}/OpenThesaurus_Deutsch_dictionaryfile.zip",
      verified: "github.com/Tekl/openthesaurus-deutsch/"
  homepage "https://tekl.de/"

  livecheck do
    url "https://github.com/Tekl/openthesaurus-deutsch/releases/latest"
    strategy :page_match do |page|
      page.scan(%r{href=.*?tags/v?(\d+(?:\.\d+)+)}i)
          .map { |matches| (matches[0]).to_s }
    end
  end

  # Moved for consistency: By default Installer.pkg installs it for all users.
  dictionary "OpenThesaurus Deutsch.dictionary", target: "/Library/Dictionaries/OpenThesaurus Deutsch.dictionary"

  caveats <<~EOS
    Installing OpenThesaurus Deutsch for all users.
    If it should be installed only for the current user, run:
      mv /Library/Dictionaries/OpenThesaurus\ Deutsch.dictionary ~/Library/Dictionaries/

    You may need to activate OpenThesaurus Deutsch in Dictionary’s preferences.
  EOS
end
