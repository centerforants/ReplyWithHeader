#!/bin/sh

#  Install-or-Upgrade.command
#  ReplyWithHeader
#
#  Created by Jeevanandam M. on Oct 24, 2013.
#

mh_install_path=${HOME}/Library/Mail/Bundles
mh_plugin=${mh_install_path}/ReplyWithHeader.mailbundle

if [ ! -e ${mh_install_path} ]; then
    echo "\nCreating ${mh_install_path}"
    mkdir -p ${mh_install_path}
fi

if [ -s ${mh_plugin} ]; then
	echo "\nPlugin is already install, let's upgrade it"
	rm -rf ${mh_plugin}
fi

chk_res=$(defaults read com.apple.mail EnableBundles)
if [[ ${chk_res} -ne "1" ]]; then
	echo "Plugin support not enabled in Mail.app, let's enable it"
	defaults write com.apple.mail EnableBundles -bool true
	#defaults write com.apple.mail BundleCompatibilityVersion $PLUGIN_COMPAT
	echo "Plugin support is now enabled in Mail.app"
else
	echo "Plugin support already enabled in Mail.app, no action required."
fi
