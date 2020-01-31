import 'package:flutter/material.dart';

import 'VideoPlay.dart';

Widget Trending(data) {
  if (data == null) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.red),)
          ],
        ),
      ),
    );
  }
  else {
    return Column(
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  IconButton(
                    iconSize: 64,
                    onPressed: () {},
                    icon: CircleAvatar(
                      radius: 100,
                      // backgroundColor: Colors.grey[800],
                      child: Icon(Icons.music_note, size: 50,),
                    ),
                  ),
                  Text('Music', style: TextStyle(color: Colors.grey[500]),)
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    iconSize: 64,
                    onPressed: () {},
                    icon: CircleAvatar(
                      radius: 100,
                      // backgroundColor: Colors.grey[800],
                      child: Icon(Icons.games, size: 50,),
                    ),
                  ),
                  Text('Gaming', style: TextStyle(color: Colors.grey[500]),)
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    iconSize: 64,
                    onPressed: () {},
                    icon: CircleAvatar(
                      radius: 100,
                      // backgroundColor: Colors.grey[800],
                      child: Icon(Icons.new_releases, size: 50,),
                    ),
                  ),
                  Text('News', style: TextStyle(color: Colors.grey[500]),)
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    iconSize: 64,
                    onPressed: () {},
                    icon: CircleAvatar(
                      radius: 100,
                      // backgroundColor: Colors.grey[800],
                      child: Icon(Icons.local_movies, size: 50,),
                    ),
                  ),
                  Text('Movies', style: TextStyle(color: Colors.grey[500]),)
                ],
              ),

              Column(
                children: <Widget>[
                  IconButton(
                    iconSize: 64,
                    onPressed: () {},
                    icon: CircleAvatar(
                      radius: 100,
                      // backgroundColor: Colors.grey[800],
                      child: Icon(Icons.music_note, size: 50,),
                    ),
                  ),
                  Text('Fashion', style: TextStyle(color: Colors.grey[500]),)
                ],
              ),
            ],
          ),
        ),
        Padding(padding: EdgeInsets.all(5),),
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Column(
                  children: <Widget>[
                    
                    Container(width: double.infinity, child: Image.network(data[index]['ThumbmnilURL'], fit: BoxFit.cover,)),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(data[index]['ProfileiconURL']),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(data[index]['Title'], style: TextStyle(fontSize: 18),),
                          Text('${data[index]['Name']} . ${data[index]['Views']} . ${data[index]['Day']}', style: TextStyle(fontSize: 13, color: Colors.grey)),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: () {},
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(5),)
                  ],
                ),
                onTap: () {
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => VideoPlayerScreen(data, index))
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}