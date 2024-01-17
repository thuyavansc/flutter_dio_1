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
              const SizedBox(height: 10,),
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
              const SizedBox(height: 10,),
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
              const SizedBox(height: 20,),
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
              const SizedBox(height: 10,),
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
              const SizedBox(height: 10,),
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
            ],
          ),
        ),
      ),
    );
  }

  //Create Method for api get
  void fetchData() async{
    var dio = Dio();
    //Response response = await dio.get('https://jsonplaceholder.typicode.com/todos/1');
    Response response = await dio.get('https://653e4d91f52310ee6a9ace3c.mockapi.io/user');
    print('This is from GET - ');
    //print('$response');
    print(response.statusCode);
    print(response.data);

  }

  //Create Method for api post
  void postData() async{
    var dio = Dio();
    var postResponse = await dio.post(
        'https://653e4d91f52310ee6a9ace3c.mockapi.io/user',
      data: {"firstName":"Mark 2","lastName":"Spector 2","age":20}
    );

    print('This is from POST -');
    //print('$postResponse');
    print(postResponse.statusCode);
    print(postResponse.data);

  }

  //Create Method for api get-post concurrently
  void getPostData() async{
    var dio = Dio();
    var getPostResponse = await Future.wait([
      dio.get('https://653e4d91f52310ee6a9ace3c.mockapi.io/user'),
      dio.post('https://653e4d91f52310ee6a9ace3c.mockapi.io/user')
    ]);

    print('This is from get-post concurrently - ');
    //print('This is from POST - $getPostResponse');
    print(getPostResponse[0].statusCode);
    print(getPostResponse[0].data);
    print(getPostResponse[1].statusCode);
    print(getPostResponse[1].data);

  }

  //Create Method for api put - update entire row/record
  void putData() async{
    var dio = Dio();
    var postResponse = await dio.put(
        'https://653e4d91f52310ee6a9ace3c.mockapi.io/user/9',
        data: {"firstName":"Mark put - 1","lastName":"Spector put - 1","age":99}
    );

    print('This is from Put - ');
    //print('This is from PUT - $postResponse');
    print(postResponse.statusCode);
    print(postResponse.data);

  }
  //Create Method for api patch - update specific field only
  void patchData() async{
    var dio = Dio();
    var patchResponse = await dio.patch(
        'https://653e4d91f52310ee6a9ace3c.mockapi.io/user/9',
        data: {"firstName":"Mark patch - 9"}
    );

    print('This is from Patch - ');
    //print('This is from PUT - $patchResponse');
    print(patchResponse.statusCode);
    print(patchResponse.data);

  }
  //Create Method for api Delete
  void deleteData() async{
    var dio = Dio();
    var patchResponse = await dio.delete(
        'https://653e4d91f52310ee6a9ace3c.mockapi.io/user/10'
    );

    print('This is from Delete - ');
    //print('This is from PUT - $patchResponse');
    print(patchResponse.statusCode);
    print(patchResponse.data);

  }

}

