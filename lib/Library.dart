import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';


  // void changeBrightness() {
  //   DynamicTheme.of(context).setBrightness(Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark);
  // }

Widget Library(dark) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(padding: EdgeInsets.all(5),),
      Text('  Recent', style: TextStyle(fontSize: 20)),
      Padding(padding: EdgeInsets.all(5),),
      Container(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network('https://as.ftcdn.net/r/v1/pics/7b11b8176a3611dbfb25406156a6ef50cd3a5009/home/discover_collections/optimized/image-2019-10-11-11-36-27-681.jpg', height: 80, width: 150,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 10),),
                      Text('Nice Video', style: TextStyle(fontSize: 15)),
                      Padding(padding: EdgeInsets.only(left: 40),),
                      Icon(Icons.more_vert)
                    ],
                  ),
                  Text('   Channel', style: TextStyle(fontSize: 13, color: Colors.grey[500]))
                ],
              );
            },
          ),
        ),
        ListTile(
          leading: Icon(Icons.history),
          title: Text('History', style: TextStyle(fontSize: 17),),
        ),
        ListTile(
          leading: Icon(Icons.file_download),
          title: Text('Downloads', style: TextStyle(fontSize: 17),),
        ),
        ListTile(
          leading: Icon(Icons.video_label),
          title: Text('My videos', style: TextStyle(fontSize: 17),),
        ),
        ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text('Purchases', style: TextStyle(fontSize: 17),),
        ),
        ListTile(
          leading: Icon(Icons.watch_later),
          title: Text('Watch later', style: TextStyle(fontSize: 17),),
        ),

        ListTile(
          leading: Icon(Icons.brightness_medium),
          title: Text('Theme', style: TextStyle(fontSize: 17),),
          onTap: () {
            dark();
          },
        )
    ],
  );
}