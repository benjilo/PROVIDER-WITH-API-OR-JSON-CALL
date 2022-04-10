import 'package:flutter/material.dart';
import 'package:flutterapp/page/video.dart';
import 'package:provider/provider.dart';

import 'modelprovider/video_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API or JSON with Provider',
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => videodata(),
        builder: (context, child) {
          return videoPage();
        },
      ),
    );
  }
}
