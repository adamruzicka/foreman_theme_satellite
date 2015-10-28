# ForemanThemeSatellite

This is a plugin based on foreman_theme plugin.
It knows to inject its assets before the core ones, so
if an asset with the same name exists both in core and
in the plugin - plugin's one will be used.
This concept allows us to replace images, javascript files and
css files completely.
It switches the needed texts(e.g foreman => satellite) by using the gettext gem
and creats a dictionary.

## Installation

See [How_to_Install_a_Plugin](http://projects.theforeman.org/projects/foreman/wiki/How_to_Install_a_Plugin)
for how to install Foreman plugins.
This plugin counts on having foreman installed on /usr/share in case it isn't please use "ln -s foreman_dir_path /usr/share/foreman

## Before packaging
Those steps need to be made.
#### step 1:
rake create_english_dictionary
#### step 2:
rake before_translation
#### step 3:
place the tranlated files in the locale/{language}
#### step 4:
rake after_translation
#### step 5:
rake locale:pack

## Usage
For using this plugin and turning foreman into satellite do the following steps
#### step 1:
clone this project.
move to foreman dir, and place it in your gemfile as "foreman_theme_satellite".
#### step 2:
rake create_english_dictionary
#### step 3:
rake locale:pack
#### step 4:
RAILS_ENV=production rake assets:precompile


#####For scss/css

- On top of the new file add `@import path/*filename` to the core files is need(if installed from package the path will be /usr/share/foreman/app/assets/stylesheets).

*Imprtant note* : add `//=include_foreman stylesheets/*filename` If the core file includes a sprockets //=require*.

#####For javascripts

- On top of the new file add `//=include_foreman javascripts/*filename`.

#####For images

- Add a file to the assets/images with the same name as the image you want to override.

## How the translation dictionary works

The translation process and packaging will work in the following way:
1)run rake gettext:find this will generate regular en.po file.

example : msgid  "welcome to foreman"
          msgstr ""

2) "translate" the needed sentences(containing products names) using a rake create_english_dictionary (this rake task will switch the needed words and create a "dictionary").

***this will be the final en.po file and will use us as a dictionary:
example : msgid  "welcome to foreman"
          msgstr "welcome to satellite"


3) First switch, rake translate:before_translation this task will edit the new [language].po file and switch all the words needed(e.g foreman,smart-proxy etc).

original [language].po: msgid  "welcome to foreman"
                             msgstr ""

                                  ||

                   turn to : msgid  "welcome to satellite"
                             msgstr ""


*this file will be sent for translation.

4) get the translated files and placing them inside locale.

example(it) : msgid  "welcome to satellite"
              msgstr "Benvenuto su satellite"

5) Second switch, rake translation:after_translation this task will switch the the msgid with msgid of the en.po file by matching the msgid(edit.it.po file that we translated) to msgstr of the en.po.


example(it) :  match it.po msgid with en.po msgstr and place en.po msgid instead.

translated file(it)-  msgid  "welcome to satellite"   <=     en.po-  msgid  "welcome to foreman"
                      msgstr "Benvenuto su satellite"     =>         msgstr "welcome to satellite"

***the outcome file will be the it.po file:
outcome(it.po):       msgid  "welcome to foreman"
                      msgstr "Benvenuto su satellite"


The words switching will be made by a dictionary that could be configure easily.

## Copyright

Copyright (c) *year* *your name*

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

