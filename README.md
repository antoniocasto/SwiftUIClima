# SwiftUIClima
## Check the weather with the power of SwiftUI.
- - - -

### Preview 

<div>
    <img src="/doc/1.PNG" width="180px"</img>
    <img src="/doc/2.PNG" width="180px"</img>
    <img src="/doc/3.PNG" width="180px"</img>
    <img src="/doc/4.PNG" width="180px"</img>
</div>

- - - -

### What is?
SwiftUIClima is an iPhone application, written in **SwiftUI** that allows you to keep track of weather conditions at your location and favorite places.
It leverages the versatility of SwiftUI and the beauty of LottieFiles to present the user with a simple and attractive UI.
The app uses the OpenWeather API to obtain results on weather conditions.

Supported languages: **English**, **Italian**.
- - - -

### App Structure

Navigate the application through a **tab** interface. 

- **Locations** tab: 
Here you will find a list of your favorite locations.
You can search the weather conditions for a location and, if you wish, add it to your favorites. Search for it using the search bar and click on the location found. This action will take you to the weather forecast screen for that place, where you can actually add the place to favorites.

- **Weather** tab: 
Shows weather conditions for the user's current location.
The UI shows the name of the place where you are, the temperature, and a description of the weather conditions.
At the bottom you will find a bottom sheet: swipe up to drag it up and get more details about the weather conditions such as sunrise and sunset times, wind speed, perceived temperature, humidity percentage, and visibility.

- **Settings** tab: 
In the settings you will find a section to change the units for temperature, speed and distance. You can also change the theme and language used by the app.
- - - -

### Theme customization
SwiftUIClima allows you to set a light theme or a dark theme, regardless of what you chose from the iOS settings, to please your eyes.
Alternatively, you can choose to have the theme fit the one you chose from the iOS settings.
- - - -

### Configuration: how to run the app
Before you run the app you must:

- Create a Config.xcconfig file through Xcode.

- Place it inside "SwiftUIClima/SwiftUIClima/Config/" folder close to Environment.swift file. Please use this name, otherwise you should set a different configuration file name in project settings (see https://moinulhassan.medium.com/read-variables-from-env-file-to-xcconfig-files-for-different-schemes-in-xcode-3ef977a0eef8 if you decided to change the name of the file).

- Add a key value pair to this config file "API_KEY=< your api key >" (without ""). < your api key > must be replaced with an API KEY generated on https://openweathermap.org website.

- Build & Run the app.
- - - -

### Features of interest (developer perspective)
- MVVM used for architectural pattern
- Networking via URLSession and Decodable protocol to fetch weather data
- Core Data for favorite places persistence
- Core Location for user location
- UserDefaults - @AppStorage
- State management via @StateObject and ObservableObject
- Permission management
- App translation: English, Italian
- - - -

### Credits
- LottieFiles / lottie-ios: https://github.com/airbnb/lottie-ios.git
- AckGen: https://github.com/MartinP7r/AckGen

- - - -
