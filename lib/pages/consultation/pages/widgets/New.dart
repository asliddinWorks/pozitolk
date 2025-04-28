import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter/material.dart';



class New extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebSocketExample(),
    );
  }
}

class WebSocketExample extends StatefulWidget {
  @override
  _WebSocketExampleState createState() => _WebSocketExampleState();
}

class _WebSocketExampleState extends State<WebSocketExample> {
  late final Uri uri;
  late final WebSocketChannel _channel;

  @override
  void initState() {
    super.initState();
    uri = Uri.parse('wss://backend.xn--g1acgdmcd1a.xn--p1ai/ws/chat/13/?token=c5f2f416a1f563de1e251a679072c1dee701a5fb&user_type=psychologist');

    _channel = WebSocketChannel.connect(uri);
    _channel.stream.listen((message) {
      print('Received: $message');
    }, onError: (error) {
      print('Error: $error');
    }, onDone: () {
      print('Connection closed');
    });
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebSocket Example'),
      ),
      body: Center(
        child: Text('WebSocket connection established.'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _channel.sink.add('Hello from Flutter!');
        },
        child: Icon(Icons.send),
      ),
    );
  }
}