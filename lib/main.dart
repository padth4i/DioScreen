import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_app/data/response.dart';
import 'package:dio_app/screens/response_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _messageController = new TextEditingController();
    TextEditingController _senderController = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _messageController,
              decoration: InputDecoration(hintText: 'Message'),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _senderController,
              decoration: InputDecoration(hintText: 'Sender'),
            ),
            SizedBox(height: 30),
            FlatButton(
              onPressed: () async {
                String response = await getLink(
                    _messageController.text, _senderController.text);
                final data =
                    LinkResponse.fromJson(json.decode(response.toString()))
                        .string;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResponsePage(
                      string: data,
                    ),
                  ),
                );
              },
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<String> getLink(String message, String sender) async {
  Dio dio = new Dio(BaseOptions(baseUrl: "http://13.233.173.34:8080"));
  Response response;
  try {
    response = await dio.post(dio.options.baseUrl + "/api/classify-sms",
        queryParameters: {"message": message, "sender": sender});
    print(response.toString());
  } catch (e) {
    print(e);
  }
}
