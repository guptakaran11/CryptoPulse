
# CryptoPulse: Your Ultimate Crypto Tracker

Welcome to CryptoPulse, a Flutter application designed for tracking cryptocurrency prices with a beautiful user interface. This app utilizes the REST API provided by CoinGecko to fetch real-time data about various cryptocurrencies. Provider state management is implemented to handle state changes efficiently.


## Features

- **Cryptocurrency Tracker** : Track the prices of various cryptocurrencies.
- **Graph Visualization** : View graphical representation of cryptocurrency prices over time.
- **24-hour Change** : Monitor the percentage change in cryptocurrency prices over the last 24 hours.
- **Highs and Lows** : Get information about the highest and lowest values of a cryptocurrency within a specific time frame.
- **Current Value** : Display the current value of the selected cryptocurrency.



## Installation
To get started with this project, follow these steps:

- Clone the repository to your local machine:

```bash
  git clone https://github.com/guptakaran11/CryptoPulse.git
```
- Navigate to the project directory.

```bash
  cd cryptopulse
```
- Install dependencies using Flutter's package manager, pub.

```bash
  flutter pub get
```

- Run the app on your preferred device (emulator/simulator or physical device).

```bash
  flutter run
```


## Tech Stack

**Flutter:** The UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.

**Provider:**  A state management library for Flutter that works seamlessly with Flutter's devtools and enables a reactive programming style.

**REST API:**  Integration with TheMovieDB.org's API to fetch movie data.

**HTTP Package:**  A composable, multi-platform, Future-based API for HTTP requests.


## Contributing

Contributions are always welcome!

Feel free if you have any suggestions, bug reports, or feature requests, please open an issue or submit a pull request.

See `contributing.md` for ways to get started.

Please adhere to this project's `code of conduct`.


## API Reference

#### Get all items

```bash
  GET https://api.coingecko.com/api/v3/coins/markets
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | **Required**. Your API key |

#### Get item

```bash
  GET https://api.coingecko.com/api/v3/coins/markets?vs_currency=$currency&order=market_cap_desc&per_page=$noOfCurrencies&page=1&sparkline=false&locale=en&x_cg_demo_api_key=$apiKey
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id of item to fetch
| `currency`| `string` | **Required**. Region of item to fetch
| `No of Data` | `int` | **Required**. no of item to fetch



