import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () {
                    fetchData();
                  },
                label: const Text(
                  'Fetch Data',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 30,
                  ),
                ),
                icon: const Icon(
                  Icons.play_arrow_sharp,
                  color: Colors.red,
                size: 40,),
              )
            ],
          ),
        ),
      ),
    );
  }

  //Create Method for api call
  void fetchData() async{
    var dio = Dio();
    Response response = await dio.get('https://jsonplaceholder.typicode.com/todos/1');
    print(response.statusCode);
    print(response.data);

  }
}

