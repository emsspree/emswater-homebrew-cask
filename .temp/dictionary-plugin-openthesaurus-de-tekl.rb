cask "dictionary-plugin-openthesaurus-de-tekl" do
  version :latest
  sha256 :no_check

  url "https://github.com/Tekl/openthesaurus-deutsch/releases/latest/download/OpenThesaurus_Deutsch_dictionaryfile.zip"
  name "OpenThesaurus Deutsch"
  name "OpenThesaurus German"
  name "OpenThesaurus Deutsch (German)"
  desc "OpenThesaurus.de plugin by Tekl for Apple’s Dictionary.app"
  homepage "https://github.com/Tekl/openthesaurus-deutsch"
  license :commercial

  ## install
  dictionary "OpenThesaurus Deutsch.dictionary"
  postflight do
    FileUtils.killall DictionaryPanel
    FileUtils.killall com.apple.DictionaryServiceHelper 
    FileUtils.killall Dictionary
  end
  caveats <<~EOS
    You need to run LibreOffice at least once before installing
    language pack to avoid app verification error.
  EOS

  ## uninstall
# uninstall pkgutil "de.tekl.dictionary.openThesaurusDeutsch"
# uninstall delete  . . .
# uninstall delete: "#{staged_path}/#{token}"

end
