cask "dictionary-openthesaurus-de-tekl" do
  version "2021.12.09"
  sha256 :no_check

  url "https://github.com/Tekl/openthesaurus-deutsch/releases/download/v#{version}/OpenThesaurus_Deutsch_dictionaryfile.zip",
      verified: "github.com/Tekl/openthesaurus-deutsch/"
  name "OpenThesaurus Deutsch"
  desc "OpenThesaurus in Deutsch (www.openthesaurus.de) von Tekl für die Lexikon-Anwendung. Extends macOS’ Dictionary application with a German thesaurus based on data from www.openthesaurus.de"
  homepage "https://tekl.de/"

  livecheck do
    url "https://github.com/Tekl/openthesaurus-deutsch/releases/latest"
    strategy :page_match do |page|
      page.scan(%r{href=.*?tags/v?(\d+(?:\.\d+)+)}i)
          .map { |matches| (matches[0]).to_s }
    end
  end

  preflight do
    system "echo", '"Hallo Welt"'
  end

  # Moved for consistency: By default Installer.pkg installs it for all users; notice in caveats.
  dictionary "OpenThesaurus Deutsch.dictionary", target: "/Library/Dictionaries/OpenThesaurus Deutsch.dictionary"

  language "de" do
    caveats <<~EOS
      OpenThesaurus Deutsch wird für alle Benutzer installiert.
      Wenn es nur für den aktuellen Benutzer installiert werden soll, führe folgendes aus:
        mv /Library/Dictionaries/OpenThesaurus\ Deutsch.dictionary ~/Library/Dictionaries/

      Eventuell muss OpenThesaurus Deutsch in den Lexikon-Einstellungen aktiviert werden.
    EOS
    "de"
  end
  language "en", default: true do
    caveats <<~EOS
      Installing OpenThesaurus Deutsch for all users.
      If it should be installed only for the current user, run:
        mv /Library/Dictionaries/OpenThesaurus\ Deutsch.dictionary ~/Library/Dictionaries/

      You may need to activate OpenThesaurus Deutsch in Dictionary’s preferences.
    EOS
    "en"
  end
end
