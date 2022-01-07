cask 'dictionary-openthesaurus-de-tekl' do
  version '2021.12.09'
  sha256 :no_check

  url "https://github.com/Tekl/openthesaurus-deutsch/releases/download/v#{version}/OpenThesaurus_Deutsch_dictionaryfile.zip"
  name 'OpenThesaurus Deutsch'
  desc 'OpenThesaurus in Deutsch (www.openthesaurus.de) von Tekl für die Lexikon-Anwendung. Extends macOS’ Dictionary application with a German thesaurus based on data from www.openthesaurus.de'
  homepage 'https://github.com/Tekl/openthesaurus-deutsch'

  livecheck do
    url 'https://github.com/Tekl/openthesaurus-deutsch/releases/latest'
    strategy :page_match do |page|
      page.scan(%r{href=.*?tags/v?(\d+(?:\.\d+)+)}i)
          .map { |matches| "#{matches[0]}" }
    end
  end

  # Moved for consistency: By default Installer.pkg installs it for all users; notice in caveats.
  dictionary 'OpenThesaurus Deutsch.dictionary', target: '/Library/Dictionaries/OpenThesaurus Deutsch.dictionary'

  caveats <<~EOS
    OpenThesaurus Deutsch has been installed for all users.
    If it should only be installed for the current user, run:
      mv /Library/Dictionaries/OpenThesaurus\ Deutsch.dictionary ~/Library/Dictionaries/

    You may need to activate this plugin (reference source) in Dictionary’s preferences.
  EOS

end
