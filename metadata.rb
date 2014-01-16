maintainer       "Steffen Gebert"
maintainer_email "steffen.gebert@typo3.org"
license          "Apache2"
description      "Installs/Configures locales"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.1.1"
recipe           "locales", "Sets up locales on the server and sets a server time zone."


%w{ubuntu debian}.each do |os|
  supports os
end
