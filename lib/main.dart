import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:logger/logger.dart';

import 'log/log_viewer.dart';



void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  // Create a list to store logs
  static List<String> logs = [];

  // Variable to store the last ID
  String? lastId;

  //const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white24,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //const SizedBox(height: 5,),
              const Divider(height: 10,),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'This API call using Dio in Flutter',
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,

                  ),
                ),
              ),
              const Divider(height: 10,),
              //GET--------------
              Row(
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
                  ),
                  TextButton.icon(
                    onPressed: () {
                      clearLogs();
                    },
                    label: const Text(
                      'Clear Log Data',
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 20,
                      ),
                    ),
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,),
                  ),
                ],
              ),
              const SizedBox(height: 5,),
              //GET--------------
              TextButton.icon(
                onPressed: () {
                  getByIdData();
                },
                label: Text(
                  'GetById Data',
                  style: TextStyle(
                    color: Colors.lightBlue[200],
                    fontSize: 30,
                  ),
                ),
                icon: const Icon(
                  Icons.play_arrow_sharp,
                  color: Colors.red,
                  size: 40,),
              ),
              const SizedBox(height: 5,),
              //POST------------------
              TextButton.icon(
                onPressed: () {
                  postData();
                },
                label: const Text(
                  'Post Data',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                  ),
                ),
                icon: const Icon(
                  Icons.play_arrow_sharp,
                  color: Colors.red,
                  size: 40,),
              ),
              const SizedBox(height: 5,),
              //GET-POST--------------------
              TextButton.icon(
                onPressed: () {
                  getPostData();
                },
                label: const Text(
                  'Get Post Data',
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 30,
                  ),
                ),
                icon: const Icon(
                  Icons.play_arrow_sharp,
                  color: Colors.red,
                  size: 40,),
              ),
              const SizedBox(height: 5,),
              //PUT-----------------------
              TextButton.icon(
                onPressed: () {
                  putData();
                },
                label: Text(
                  'Put Data',
                  style: TextStyle(
                    color: Colors.yellow[400],
                    fontSize: 30,
                  ),
                ),
                icon: const Icon(
                  Icons.play_arrow_sharp,
                  color: Colors.red,
                  size: 40,),
              ),
              const SizedBox(height: 5,),
              //PATCH-----------------------
              TextButton.icon(
                onPressed: () {
                  patchData();
                },
                label: const Text(
                  'Patch Data',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 30,
                  ),
                ),
                icon: const Icon(
                  Icons.play_arrow_sharp,
                  color: Colors.red,
                  size: 40,),
              ),
              const SizedBox(height: 5,),
              //DELETE-----------------------
              TextButton.icon(
                onPressed: () {
                  deleteData();
                },
                label: const Text(
                  'Delete Data',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 30,
                  ),
                ),
                icon: const Icon(
                  Icons.play_arrow_sharp,
                  color: Colors.red,
                  size: 40,),
              ),
              const SizedBox(height: 10,),
              // Log section
              Expanded(
                child: Container(
                  color: Colors.black, // Adjust color as needed
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: LogViewer(logs: logs),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to add logs
  void addLog(String log) {
    setState(() {
      logs.add(log);
    });
  }

  // Method to clear logs
  void clearLogs() {
    setState(() {
      logs.clear();
    });
  }

  //Create Method for api get
  void fetchData0() async {
    var dio = Dio();
    //Response response = await dio.get('https://jsonplaceholder.typicode.com/todos/1');
    Response response = await dio.get(
        'https://653e4d91f52310ee6a9ace3c.mockapi.io/user');
    print('This is from GET - ');
    //print('$response');
    print(response.statusCode);
    print(response.data);

    // Adding log
    addLog('GET Request - Status Code: ${response.statusCode}');
  }

  //Create Method for api get
  void fetchData1() async {
    var dio = Dio();
    Response response;

    try {
      response =
      await dio.get('https://653e4d91f52310ee6a9ace3c.mockapi.io/user');
      // print('This is from GET - ');
      // print(response.statusCode);
      // print(response.data);


      // Adding log
      addLog('GET Request - Status Code: ${response.statusCode}');
      addLog('Response Data: ${response.data}');
    } catch (error) {
      print('Error fetching data: $error');
      // Adding error log
      addLog('Error fetching data: $error');
    }
  }

  // Create Method for API get
  void fetchData() async {
    var dio = Dio();
    Response response;

    try {
      response =
      await dio.get('https://653e4d91f52310ee6a9ace3c.mockapi.io/user');

      // Adding log
      addLog('GET Request - Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data;

        if (responseData.isNotEmpty) {
          // Get the last item in the list
          Map<String, dynamic> lastItem = responseData.last;

          // Extract the ID from the last item
          lastId = lastItem['id'].toString();

          // Log the last item ID
          addLog('Last Item ID: $lastId');
          // Adding log
          addLog('GET Request - Status Code: ${response.statusCode}');
          addLog('Response Data: ${response.data}');
        } else {
          // Log a message if the response is empty
          addLog('Response Data is empty');
        }
      } else {
        // Log a message if the response status code is not 200
        addLog('Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
      // Adding error log
      addLog('Error fetching data: $error');
    }

    // Trigger a rebuild by calling setState
    setState(() {});
  }

  // Create Method for api get by ID
  void getByIdData() async {
    var dio = Dio();
    try {
      // Get the lastId or handle it based on your application logic
      String? targetId = lastId;

      var getByIdResponse = await dio.get(
          'https://653e4d91f52310ee6a9ace3c.mockapi.io/user/$targetId'
      );

      print('This is from Get by ID - ');
      print(getByIdResponse.statusCode);
      print(getByIdResponse.data);

      addLog('This is from Get by ID - ');
      addLog(getByIdResponse.statusCode.toString());
      addLog(getByIdResponse.data.toString());
    } on DioError catch (e) {
      // Handle DioError
      if (e.response != null && e.response!.statusCode == 401) {
        addLog('Error: Unauthorized (401)');
      } else {
        addLog('Error: ${e.message}');
      }
    } catch (error) {
      print('Error making requests: $error');
      addLog('Error making requests: $error');
    }
  }



  //Create Method for api post
  void postData0() async {
    var dio = Dio();
    var postResponse = await dio.post(
        'https://653e4d91f52310ee6a9ace3c.mockapi.io/user',
        data: {"firstName": "Mark 2", "lastName": "Suit 2", "age": 20}
    );

    print('This is from POST -');
    //print('$postResponse');
    print(postResponse.statusCode);
    print(postResponse.data);

    addLog('This is from POST -');
    //addLog(log)('$postResponse');
    addLog(postResponse.statusCode.toString());
    addLog(postResponse.data.toString());
  }

  // Create Method for api post
  void postData() async {
    var dio = Dio();
    Response postResponse;

    try {
      // Increment lastId by 1
      int nextId = int.parse(lastId!) + 1;
      postResponse = await dio.post(
        'https://653e4d91f52310ee6a9ace3c.mockapi.io/user',
        data: {"firstName": "Mark $nextId", "lastName": "Suit $nextId", "age": nextId},
      );

      print('This is from POST -');
      print(postResponse.statusCode);
      print(postResponse.data);

      // Check if the post was successful (status code 201)
      if (postResponse.statusCode == 201) {
        // Extract the ID from the response data
        String? postId = postResponse.data['id'].toString();

        // Set the lastId to the newly created ID
        lastId = postId;

        // Log the last ID
        addLog('Last Item ID (from POST): $lastId');
        addLog('Response Data: ${postResponse.data}');
      } else {
        // Log a message if the post request was not successful
        addLog('Error: ${postResponse.statusCode}');
      }
    } catch (error) {
      print('Error posting data: $error');
      // Adding error log
      addLog('Error posting data: $error');
    }

    // Trigger a rebuild by calling setState
    setState(() {});
  }



  //Create Method for api get-post concurrently
  void getPostData0() async {
    var dio = Dio();
    var getPostResponse = await Future.wait([
      dio.get('https://653e4d91f52310ee6a9ace3c.mockapi.io/user/$lastId'),
      dio.post('https://653e4d91f52310ee6a9ace3c.mockapi.io/user')
    ]);

    print('This is from get-post concurrently - ');
    //print('This is from POST - $getPostResponse');
    print(getPostResponse[0].statusCode);
    print(getPostResponse[0].data);
    print(getPostResponse[1].statusCode);
    print(getPostResponse[1].data);

    addLog('This is from get-post concurrently - ');
    //addLog(log)('This is from POST - $getPostResponse');
    addLog(getPostResponse[0].statusCode.toString());
    addLog(getPostResponse[0].data.toString());
    // addLog(getPostResponse[1].statusCode.toString());
    // addLog(getPostResponse[1].data.toString());

    // Check if the post was successful (status code 201)
    if (getPostResponse[1].statusCode == 201) {
      // Extract the ID from the response data
      String? postId = getPostResponse[1].data['id'].toString();

      // Set the lastId to the newly created ID
      lastId = postId;

      // Log the last ID
      addLog('Last Item ID (from POST): $lastId');
      addLog(getPostResponse[0].statusCode.toString());
      addLog('Response Data: ${getPostResponse[1].data.toString()}');
    } else {
      // Log a message if the post request was not successful
      addLog('Error: ${getPostResponse[1].statusCode.toString()}');
    }
  }

  //Create Method for api get-post concurrently
  void getPostData() async {
    var dio = Dio();
    try {
      var getPostResponse = await Future.wait([
        dio.get('https://653e4d91f52310ee6a9ace3c.mockapi.io/user/$lastId'),
        dio.post('https://653e4d91f52310ee6a9ace3c.mockapi.io/user')
      ]);

      print('This is from get-post concurrently - ');
      print(getPostResponse[0].statusCode);
      print(getPostResponse[0].data);
      print(getPostResponse[1].statusCode);
      print(getPostResponse[1].data);

      addLog('This is from get-post concurrently - ');
      addLog(getPostResponse[0].statusCode.toString());
      addLog(getPostResponse[0].data.toString());

      if (getPostResponse[1].statusCode == 201) {
        String? postId = getPostResponse[1].data['id'].toString();
        lastId = postId;
        addLog('Last Item ID (from POST): $lastId');
        addLog(getPostResponse[0].statusCode.toString());
        addLog('Response Data: ${getPostResponse[1].data.toString()}');
      } else if (getPostResponse[1].statusCode == 404) {
        // Handle 404 status code (Not Found) for the POST request
        addLog('Error: 404 Not Found');
      } else {
        addLog('Error: ${getPostResponse[1].statusCode.toString()}');
      }
    } catch (error) {
      print('Error making requests: $error');
      addLog('Error making requests: $error');
    }
  }



  //Create Method for api put - update entire row/record
  void putData0() async {
    var dio = Dio();
    var postResponse = await dio.put(
        'https://653e4d91f52310ee6a9ace3c.mockapi.io/user/9',
        data: {
          "firstName": "Mark put - 1",
          "lastName": "Suit put - 1",
          "age": 99
        }
    );

    print('This is from Put - ');
    //print('This is from PUT - $postResponse');
    print(postResponse.statusCode);
    print(postResponse.data);

    addLog('This is from Put - ');
    //addLog(log)('This is from PUT - $postResponse');
    addLog(postResponse.statusCode.toString());
    addLog(postResponse.data);
  }

  // Create Method for api put - update entire row/record
  void putData() async {
    var dio = Dio();
    try {
      // Get the lastId or handle it based on your application logic
      String? targetId = lastId;

      var putResponse = await dio.put(
        'https://653e4d91f52310ee6a9ace3c.mockapi.io/user/$targetId',
        data: {
          "firstName": "Mark put - 1",
          "lastName": "Suit put - 1",
          "age": 99,
        },
      );

      print('This is from Put - ');
      print(putResponse.statusCode);
      print(putResponse.data);

      addLog('This is from Put - ');
      addLog(putResponse.statusCode.toString());
      addLog(putResponse.data.toString());
    } on DioError catch (e) {
      // Handle DioError
      if (e.response != null && e.response!.statusCode == 401) {
        addLog('Error: Unauthorized (401)');
      } else {
        addLog('Error: ${e.message}');
      }
    } catch (error) {
      print('Error making requests: $error');
      addLog('Error making requests: $error');
    }
  }


  //Create Method for api patch - update specific field only
  void patchData0() async {
    var dio = Dio();
    var patchResponse = await dio.patch(
        'https://653e4d91f52310ee6a9ace3c.mockapi.io/user/9',
        data: {"firstName": "Mark patch - 9"}
    );

    print('This is from Patch - ');
    //print('This is from PUT - $patchResponse');
    print(patchResponse.statusCode);
    print(patchResponse.data);

    addLog('This is from Patch - ');
    //addLog(log)('This is from PUT - $patchResponse');
    addLog(patchResponse.statusCode.toString());
    addLog(patchResponse.data);
  }

  // Create Method for api patch - update specific field only
  void patchData() async {
    var dio = Dio();
    try {
      // Get the lastId or handle it based on your application logic
      String? targetId = lastId;

      var patchResponse = await dio.patch(
        'https://653e4d91f52310ee6a9ace3c.mockapi.io/user/$targetId',
        data: {"firstName": "Mark patch - 9"},
      );

      print('This is from Patch - ');
      print(patchResponse.statusCode);
      print(patchResponse.data);

      addLog('This is from Patch - ');
      addLog(patchResponse.statusCode.toString());
      addLog(patchResponse.data.toString());
    } on DioError catch (e) {
      // Handle DioError
      if (e.response != null && e.response!.statusCode == 401) {
        addLog('Error: Unauthorized (401)');
      } else {
        addLog('Error: ${e.message}');
      }
    } catch (error) {
      print('Error making requests: $error');
      addLog('Error making requests: $error');
    }
  }


  //Create Method for api Delete
  void deleteData0() async {
    var dio = Dio();
    var patchResponse = await dio.delete(
        'https://653e4d91f52310ee6a9ace3c.mockapi.io/user/10'
    );

    print('This is from Delete - ');
    //print('This is from PUT - $patchResponse');
    print(patchResponse.statusCode);
    print(patchResponse.data);

    addLog('This is from Delete - ');
    //addLog(log)('This is from PUT - $patchResponse');
    addLog(patchResponse.statusCode.toString());
    addLog(patchResponse.data);
  }

  //Create Method for api Delete
  void deleteData() async {
    var dio = Dio();
    try {
      // Get the lastId or handle it based on your application logic
      String? targetId = lastId;

      var deleteResponse = await dio.delete(
          'https://653e4d91f52310ee6a9ace3c.mockapi.io/user/$targetId'
      );

      print('This is from Delete - ');
      print(deleteResponse.statusCode);
      print(deleteResponse.data);

      addLog('This is from Delete - ');
      addLog(deleteResponse.statusCode.toString());
      addLog(deleteResponse.data.toString());
    } on DioError catch (e) {
      // Handle DioError
      if (e.response != null && e.response!.statusCode == 401) {
        addLog('Error: Unauthorized (401)');
      } else {
        addLog('Error: ${e.message}');
      }
    } catch (error) {
      print('Error making requests: $error');
      addLog('Error making requests: $error');
    }
  }


}
