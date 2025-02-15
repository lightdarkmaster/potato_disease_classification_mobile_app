# potato_disease_classification

A Potato Disease Classification Mobile App Using Flutter and Convolutional Neural Network Artificial Intelligent Model Architechture.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter Packages from Here..pub.dev: ](https://pub.dev)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## How to Set up this Project?

### Step 1: Install Flutter

1. **Download Flutter SDK**  
   Visit the [Flutter Website](https://flutter.dev/docs/get-started/install) and follow the installation instructions for your operating system.

2. **Verify Installation**  
   Run the following command in your terminal to ensure Flutter is correctly installed:
   ```bash
   flutter doctor

### Step 2: Install Android Studio
1. Download [Android Studio Here](https://developer.android.com/studio) and follow the installation instructions for your operating system.

2. **Verify Installation** 

3. **Setup android studio**  

4. **Download Emulator** 

5. **Integrate Virtual Emulator path to your VS code / If you don't want virtual emulator, use physical device** 

- In your Physical Device Open Android build Version Click it 7 times.
- You are now a Developer.
- Navigate to Developer Options.
- Navigate and Allow USB Debugging.
- Connect your physical device to your computer using cable.

## Clone Repository / Project Repository
1. Be sure you have already install git.

2. Download [Git Here](https://git-scm.com/downloads) and follow the installation instructions for your operating system.

3. Install and setup git in your computer.

4. Open command prompt in your computer and type this command and press enter to clone my project repository.
   ```bash
   git clone 'https://github.com/lightdarkmaster/potato_disease_classification_mobile_app'

## Installation of the Project Instructions

1. Go to Project Directory
   ```bash
   cd seedscan
2. Install packages and dependencies
   ```bash
   flutter pub get
3. Run the project
   ```bash
   flutter run

## Building the app
1. to reduce app size follow the command below.

    ```bash
    flutter build appbundle --target-platform android-arm,android-arm64

2. Or you can use this: 
    ```bash
    flutter build appbundle --release --target-platform android-arm64

3. Or maybe this command: 
    ```bash
    flutter build apk --release --target-platform android-arm64

4. But if you want to build the app normally without target platform run this command:
    ```bash
    flutter build apk

4. Build apk for all platform single command:
    ```bash
    flutter build apk --target-platform android-arm,android-arm64,android-x64 --split-per-abi

--- end ---