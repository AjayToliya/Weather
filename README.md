
# Weather App

A simple and user-friendly weather application built using Flutter that allows users to manage their favorite cities and view real-time weather data. The app features persistent city storage and theme preferences using `SharedPreferences`.



## Features

### 1. City Management with SharedPreferences

- **Favorite Cities**: Users can add or remove cities from their list of favorites. The app stores these cities locally using `SharedPreferences`.
- **Persistent Data**: On app launch, the stored cities and their corresponding weather data are fetched from `SharedPreferences` and displayed on the home screen.

#### Adding a City:
- Users can search for a city and add it to their favorites. The city name and weather data are saved to `SharedPreferences`.

#### Removing a City:
- Users can remove any city from their favorites list, and the city will be deleted from `SharedPreferences`.

### 2. Fetching Weather Data
- The app fetches real-time weather data for the saved cities using an API.
- The weather data is displayed for each city saved in the favorites list.

### 3. Light/Dark Theme

- The app supports both light and dark modes.
- Users can toggle between the themes through the settings menu.
- The theme preference is stored in `SharedPreferences` and persists even after restarting the app.

#### Toggle Theme:
- Users can change the theme from light to dark or vice versa in the settings.

#### Persistent Theme:
- The selected theme is stored in `SharedPreferences`, ensuring the app opens with the user's chosen theme on subsequent launches.

### 4. Search for a City
- The home screen includes a search bar where users can input a city's name to fetch and display its current weather details.
- The search results show relevant weather information for the entered city.

## images

![Screenshot_20240812_113832](https://github.com/user-attachments/assets/b6416d4f-eba0-4ed0-ab7b-dcd2ba851c82)
![Screenshot_20240812_113840](https://github.com/user-attachments/assets/3717295c-18ae-4336-b162-e1d3393a1a35)
![Screenshot_20240812_113903](https://github.com/user-attachments/assets/586dcaad-ae66-4bac-9efb-7b24d6b3fc23)
![Screenshot_20240812_113911](https://github.com/user-attachments/assets/f68e5414-3dbb-4dd0-858f-f586dd38abd0)
![Screenshot_20240812_113925](https://github.com/user-attachments/assets/9f992551-19fa-456a-8e84-d3f9037d7910)

## Technologies Used

- **Flutter**: Framework for building the app.
- **Dart**: Programming language used for Flutter development.
- **SharedPreferences**: Used for storing favorite cities and theme preferences.
- **Weather API**: External API used for fetching real-time weather data.

## Getting Started

### Prerequisites

- Install [Flutter SDK](https://flutter.dev/docs/get-started/install) on your system.
- Install the required dependencies by running:

  ```bash
  flutter pub get
  ```

### Running the App

1. Clone the repository:
   ```bash
   git clone <repository-url>
   ```

2. Navigate to the project directory:
   ```bash
   cd weather_app
   ```

3. Run the app on your preferred emulator or device:
   ```bash
   flutter run
   ```

## Assets

- **Images**: Any relevant images used in the app are stored in the `assets/images/` directory.

## API Integration

- The app integrates with a weather API to fetch the current weather data for cities. Make sure to add your API key in the appropriate file in `weather_service.dart`.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

---

### Contact

For any questions or issues, feel free to reach out via the [issue tracker](https://github.com/your-username/your-repo/issues).


