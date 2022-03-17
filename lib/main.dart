import 'package:api_demo/data/repository/sample_repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Api Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = "No Data";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Demo'),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                    onPressed: () => fetchData(),
                    child: const Text(
                      "Get Call",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white),
                    )),
                SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                    style:
                        ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.pinkAccent)),
                    onPressed: () => postData(),
                    child: const Text(
                      "Post Call",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white),
                    )),
              ],
            ),
          ),
          Divider(
            height: 1.0,
            thickness: 2.0,
            color: Colors.amber,
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                result,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.deepOrange),
              ))
        ]),
      ),
    );
  }

  void fetchData() async {
    SampleRepository sampleRepository = SampleRepository();
    final data = await sampleRepository.fetchData();
    setState(() {
      result = data;
    });
  }

  void postData() async {
    SampleRepository sampleRepository = SampleRepository();
    final data = await sampleRepository.submitData();
    setState(() {
      result = data;
    });
  }
}
