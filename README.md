HMLocalization
==============

HMLocalization is a lightweight dynamic localisation framework. I have created it as a replacement to the iOS localisation framework that doesn't allow you to switch language while app is open and require you language files to be bundled with the app. 

Features
--------
* Ability to change language while the app is open without needing to relaunch the app.
* Since language files are plain text files, they could be loaded off the internet rather than being bundles with the app. This will enable you to create dynamic languages and add/remove support for languages without having to release an update for you app.
* Support for language direction for right to left languages, which enables you to layout your UI accordingly.

Compatibility
--------------
HMLocalization currently compatible with ARC only. Non-ARC support is coming soon.

Usage
-----
Included is a demo project showing how to use the framework in addition to changing the language of the app and refreshing the UI without having to relaunch it.

License
--------
Feel free to do whatever you want with this code.
