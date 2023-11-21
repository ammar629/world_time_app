# Introduction

* A portfolio application I designed to showcase my skills with flutter framework
* This app is designed to show the time in any part of the world selected by the user
* I also wrote an article about this on my blog [Codegitz](https://codegitz.com/creating-a-world-clock-app-in-flutter/)

# Supported Mediums
- Chrome Extension
- Desktop App
- Mobile App (Only tested with android for now)

# Instructions

### Chrome Extension
1. Type the following command in the terminal  `flutter build web --web-renderer html --csp`
2. Assuming you have already enabled the developer mode go to your extensions home page either by going through the chrome menu or by typing the following command in the address bar `chrome://extensions/`
3. Click `Load Unpacked`
   - Navigate to the `world_time_app/build/web` and click `Select Folder`
4. Congratulations have successfully installed the world_time_app chrome extension
   - In case you wish to change the properties of the app go to the `manifest.json` file in the `world_time_app/web/` directory and adjust it to your liking