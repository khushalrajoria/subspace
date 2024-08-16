# SubSpace - News Blog App

SubSpace is a Flutter application that fetches and displays a list of blogs from a RESTful API. Users can explore various blog topics, mark them as favorites, and read detailed views of each blog. The app is built with a focus on smooth navigation, efficient state management using Bloc, and a clean, user-friendly UI/UX.

## Features

- **API Integration**: Fetches blogs from a RESTful API using HTTP requests.
- **Blog List View**: Displays a list of blogs with titles and associated images.
- **Detailed Blog View**: Shows the full details of a selected blog, including its title and image.
- **Favorite Blogs**: Users can mark blogs as favorites, with visual indicators.
- **State Management**: Managed with Flutter's Bloc for a clean and efficient architecture.
- **Error Handling**: Gracefully handles errors and displays user-friendly messages.
- **Navigation**: Seamless navigation between the blog list and detail views.

## Screenshots

(Add screenshots of the app here)

## Installation

1. **Clone the Repository**
   ```sh
   git clone https://github.com/khushalrajoria/subspace.git
   cd subspace
   ```

2. **Install Dependencies**
   ```sh
   flutter pub get
   ```

3. **Run the App**
   ```sh
   flutter run
   ```

## Dependencies

- **Flutter SDK**
- **HTTP**: For API requests
- **Flutter Bloc**: For state management
- **Equatable**: For simplifying state comparisons

## Usage

- Launch the app to see the list of blogs.
- Tap on a blog to view its details.
- Mark blogs as favorites by tapping the heart icon.
- Navigate back to the list to explore more blogs.

## API Integration

The app integrates with a RESTful API to fetch blogs. The API request is handled using the HTTP package in Flutter.
THIS ONLY PROVIDES BLOGS BY SUBSPACE CORPORATION
Example request:
```sh
curl --request GET \
  --url https://intent-kit-16.hasura.app/api/rest/blogs \
  --header 'x-hasura-admin-secret: your-secret-key'
```

## Contributing

If you'd like to contribute to this project, feel free to fork the repository and submit a pull request. Contributions are always welcome!

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any inquiries or support, feel free to reach out.
