# YOROKE
Convalenscence & Welfare Community Platform for Elderly <br>

## flutter 설치 가이드
- Windows: https://flutter.dev/docs/get-started/install/windows
- Mac: https://flutter.dev/docs/get-started/install/macos

## Development Tools
- Android Studio
- VS code

## Hot Reload
- https://flutter-ko.dev/docs/get-started/test-drive

## Root of Application
- lib/main.dart

## Install
 [navermapplugin]: https://pub.dev/packages/naver_map_plugin

- git-lfs should be pre-installed for using [naver_map_plugin][navermapplugin] in iOS
  - ```brew install git-lfs```
  - ```git lfs install```
<br></br>
- Get & Upgrade Dependecies for Plug-ins
  - ```flutter pub get```
  - ```flutter pub upgrade```
<br></br>
- Set JSON and Serialization
  - https://flutter.dev/docs/development/data-and-backend/json
  - One-time code generation
    - ```flutter pub run build_runner build```
  - Generating code continuously
    - ```flutter pub run build_runner watch```
