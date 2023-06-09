# SwiftUIClima
SwiftUIClima is an app that aims to keep track of weather conditions at the user's location and favorite places.

### How to run
Before you run the app you must:

- Create a Config.xcconfig file through Xcode.

- Place it inside "SwiftUIClima/SwiftUIClima/Config/" folder close to Environment.swift file. Please use this name, otherwise you should set a different configuration file name in project settings (see https://moinulhassan.medium.com/read-variables-from-env-file-to-xcconfig-files-for-different-schemes-in-xcode-3ef977a0eef8 if you decided to change the name of the file).

- Add a key value pair to this config file "API_KEY=< your api key >" (without ""). < your api key > must be replaced with an API KEY generated on https://openweathermap.org website.

- Run the app.
