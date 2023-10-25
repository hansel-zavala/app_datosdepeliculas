import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  var apiKey = '98db6d11732640808fd9307975274b80';
  var movieId = 951491;
  var apiUrl = 'https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey';

  fetchMovieInfo(apiUrl);
}

void fetchMovieInfo(String apiUrl) async {
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final movieData = json.decode(response.body);

    String title = movieData['title'];
    String overview = movieData['overview'];
    String releaseDate = movieData['release_date'];

    print('Titulo: $title');
    print('Descripcion: $overview');
    print('Fecha de lanzamiento: $releaseDate');

  } else {
    print('Error al cargar los datos: ${response.reasonPhrase}');
  }
}
