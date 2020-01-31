import 'package:flutter/material.dart';

import 'VideoPlay.dart';

Widget Subscriptions(data) {
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
        Container(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  children: <Widget>[
                    IconButton(
                      iconSize: 50,
                      onPressed: () {},
                      icon: CircleAvatar(
                        radius: 300,
                        backgroundImage: NetworkImage(data[index]['ProfileiconURL']),
                        backgroundColor: Colors.pink,
                      ),
                    ),
                    Text(data[index]['Name'].substring(0, 10) + '...')
                  ],
                ),
              );
            },
          ),
        ),
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