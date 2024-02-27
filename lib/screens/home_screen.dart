import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});


  final String title;

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();

  List<Movie> _allMovies = {};
  List<Movie> _trendingMovies = {};
  List<Movie> _popularMovies ={};

  Future<void> _loadMovies() async{
    final List<Map<String, dynamic>>> allMoviesData = await _apiService.getAllMovies();
    final List<Map<String, dynamic>>> trendingMoviesData = await _apiService.getTrendingMovies();
    final List<Map<String, dynamic>>> popularMoviesData = await _apiService.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      
        title: Text(widget.title),
      ),
      body: Center(
     
        child: Column(
       
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}