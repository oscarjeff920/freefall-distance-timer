import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: Text('Go', style: TextStyle(fontFamily: 'Nunito', fontSize: 50.0)),
                style: ButtonStyle(),
                onPressed: () {
                  Navigator.of(context).pushNamed('/timer');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
