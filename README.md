# Stock Market App

This is a Flutter application for tracking and managing stock investments. It provides features like stock search, detailed stock information, price graphs, user authentication, and theme switching.

## Table of Contents

- [Features](#features)
- [Setup Instructions](#setup-instructions)
- [Dependencies](#dependencies)
- [API Configuration](#api-configuration)
- [Folder Structure](#folder-structure)
- [Demo Video](#demo-video)
- [Contributing](#contributing)
- [License](#license)

## Features

- **User Authentication:** Secure login using email and password.
- **Stock Search:** Search for stocks by symbol or name.
- **Stock Details:** View detailed information about a stock, including description and exchange.
- **Price Graphs:** Interactive line charts showing stock price trends.
- **Theme Switching:** Toggle between light and dark themes.
- **Logout:** Securely log out of the application.
- **Responsive UI:** Designed to work on various screen sizes.

## Setup Instructions

1.  **Clone the Repository:**

    ```bash
    git clone https://github.com/Maazmaahi/stock_market
    cd stock_market_app
    ```

2.  **Install Flutter:**

    Ensure you have Flutter installed on your machine. If not, follow the official Flutter installation guide: [Flutter Installation](https://flutter.dev/docs/get-started/install).

3.  **Install Dependencies:**

    ```bash
    flutter pub get
    ```

4.  **Run the App:**

    ```bash
    flutter run
    ```

    Or, if you want to run on a specific device or emulator:

    ```bash
    flutter run -d <device-id>
    ```

## Dependencies

-   `flutter_riverpod`: For state management.
-   `riverpod`: For core and state management.
-   `go_router`: For navigation.
-   `dio`: For making HTTP requests.
-   `flutter_secure_storage`: For secure storage of tokens and user data.
-   `fl_chart`: For creating interactive charts.

You can find the full list of dependencies in the `pubspec.yaml` file.

## API Configuration

This application uses an external API for stock data and user authentication. You need to configure the following:

1.  **API Base URL:**

    Update the `_baseUrl` variable in `lib/src/data/services/api_service.dart` with your API's base URL:

    ```dart
    final String _baseUrl = '[https://illuminate-production.up.railway.app/api](https://illuminate-production.up.railway.app/api)'; // Replace with your API URL
    ```

2.  **Authentication Endpoints:**

    Ensure the API endpoints for login (`/auth/local`), stock search (`/stocks/search`), stock details (`/stocks/{id}`), and price graphs (`/stocks/{id}/price-graph`) are correctly configured.

3.  **Authentication Token:**

    The application uses JWT tokens for authentication. Ensure your API generates and verifies JWT tokens.

## Folder Structure
```
stock_market_app/
├── lib/
│   ├── src/
│   │   ├── core/
│   │   │   ├── extensions/
│   │   │   ├── routes/
│   │   │   ├── storage/
│   │   │   ├── themes/
│   │   │   ├── core.dart
│   │   ├── data/
│   │   │   ├── models/
│   │   │   ├── services/
│   │   ├── presentation/
│   │   │   ├── providers/
│   │   │   ├── screens/
│   │   │   ├── widgets/
│   │   ├── app.dart
│   ├── main.dart
├── pubspec.yaml
├── README.md
```

## Demo Video

https://drive.google.com/file/d/1ScLHx3zvPVbKLR6xbowT_hgYxLo_bb8e/view?usp=sharing

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please create an issue or submit a pull request.

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Commit your changes.
4.  Push to your branch.
5.  Create a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
