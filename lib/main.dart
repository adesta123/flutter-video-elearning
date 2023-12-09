import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_elearning/bloc/post_bloc.dart';
import 'package:video_elearning/data/repository/api_repository.dart';
import 'package:video_elearning/presentation/screen/HomeScreen.dart';
import 'package:video_elearning/service/data_repository.dart';

void main() {
  runApp(MyApp(
    dataService: DataService(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.dataService}) : super(key: key);
  final DataService dataService;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bloc Api',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: BlocProvider(
        create: (context) =>
            PostBloc(apiRepository: ApiRepository(dataService: dataService))
              ..add(LoadEvent()),
        child: const  HomeScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
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
