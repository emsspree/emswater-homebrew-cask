cask "dictionary-openthesaurus-de-tekl" do
  version :latest
  sha256 :no_check

  url "https://github.com/Tekl/openthesaurus-deutsch/releases/latest/download/OpenThesaurus_Deutsch_dictionaryfile.zip"
  name "OpenThesaurus Deutsch (German)"
  desc "Extends Apple’s Dictionary application with a German thesaurus based on data from www.openthesaurus.de"
  homepage "https://github.com/Tekl/openthesaurus-deutsch"

  ## install
  dictionary "OpenThesaurus Deutsch.dictionary"
  postflight do
    FileUtils.killall "DictionaryPanel"
    FileUtils.killall "com.apple.DictionaryServiceHelper"
    FileUtils.killall "Dictionary"
  end

  ## uninstall
# uninstall pkgutil "de.tekl.dictionary.openThesaurusDeutsch"
# uninstall delete  . . .
# uninstall delete: "#{staged_path}/#{token}"

  caveats <<~EOS
    You may need to activate this plugin
    in Dictionary’s preferences.
  EOS

end
