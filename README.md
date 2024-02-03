# Fulltimeforce Challenge

FulltimeForce Challenge is an application that provides an engaging visual experience for exploring GitHub commits. The app features multiple views, including a Splash screen, a Home view for seamless navigation through Commits, and convenient access to the user's profile. Additionally, the app includes Configuration options to customize the theme and language, ensuring a satisfactory and efficient user experience.

---
## Let's start 🚀


Follow these steps to clone and run the project:

**1. Clone the repository:**
```bash
git clone https://github.com/heygonzalocaira/fulltimeforce_challenge.git
```

**2. Navigate to the project directory:**
```bash
cd fulltimeforce_challenge
```

**3. Fetch project dependencies:**
```bash
flutter clean
flutter pub get
```

**4. Run the project:**

This project handles flavor for its development (production, development and staging). In this case we are going to run the project with the production flavor.
```bash
# Production
$ flutter run --flavor production --target lib/main_production.dart
```

If you want to try the other flavors you can use these commands
```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart
```

## Project structure

The project uses a clean architecture and adopts a layered approach organized by packages. It also manages continuous integration (CI) with github and workflows.

```
├── Fulltimeforce_challenge
│   ├── .github (for CI)
│   ├── android
│   ├── assets (for img and fonts)
│   ├── ios
│   ├── lib
│   ├── packages
│   ├── test (for test)
│   ├── web

```

Within the lib folder, each functionality (or feature) is organized as a separate folder

```
├── lib
│   ├── feature
│   │   ├── bloc/cubit
│   │   ├── view
│   │   └── widgets
│   ├── feature
```

Within the packages folder, two distinct packages have been created: one called "data" for the data layer and one called "domain" for the domain layer. This reflects an organizational structure that follows the single responsibility principle, facilitating the maintenance and scalability of the project.

```
└── packages
    ├── data
    │   └── lib
    └── domain
        └── lib
```

## Running Tests 🧪
This project handles unit testing, widget testing and bloc and cubit testing. 
To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```
All tests are inside the test folder
```
├── test
│   ├── feature_test
│   ├── feature_test
```
---
## Screenshots

|     |     |    |
| :-: | :-: |:-: |
|  Splash Screen | Commits Screen | Profile |
| <img src="https://github.com/heygonzalocaira/fulltimeforce_challenge/blob/main/assets/screenshots/splash.png?raw=true" height="300" /> | <img src="https://github.com/heygonzalocaira/fulltimeforce_challenge/blob/main/assets/screenshots/commits.png?raw=true" height="300" /> | <img src="https://github.com/heygonzalocaira/fulltimeforce_challenge/blob/main/assets/screenshots/profile.png?raw=true" height="300" /> |
|  Settings | Commits in Dark theme |  |
| <img src="https://github.com/heygonzalocaira/fulltimeforce_challenge/blob/main/assets/screenshots/settings.png?raw=true" height="300" /> | <img src="https://github.com/heygonzalocaira/fulltimeforce_challenge/blob/main/assets/screenshots/dark_commits.png?raw=true" height="300" /> | |




