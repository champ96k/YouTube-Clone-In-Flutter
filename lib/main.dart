import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube/VideoPlay.dart';

import 'Home.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => new ThemeData(
        // primarySwatch: Colors.indigo,
        brightness: brightness,
        appBarTheme: AppBarTheme(
          color: Colors.white
        )
      ),
      themedWidgetBuilder: (context, theme) {
        return new MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: theme,
          home: Home(),
        );
      }
    );
  }
}