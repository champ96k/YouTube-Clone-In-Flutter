import 'package:flutter/material.dart';

Widget Inbox() {
  return ListView.builder(
    itemCount: 50,
    itemBuilder: (context, index) {
      return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage('https://darkeandtaylor.co.uk/wp/wp-content/uploads/2018/09/youtube-logo-png-transparent-image-e1537456990695.png'),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('videotitlevideotitlevideotitlevideotitlevideotitlevideotitlevideotitlevideotitle'),
            Text('4 days ago', style: TextStyle(color: Colors.grey[600], fontSize: 15),)
          ],
        ),
        // trailing: Row(
        //   children: <Widget>[
        //     Image.network('https://darkeandtaylor.co.uk/wp/wp-content/uploads/2018/09/youtube-logo-png-transparent-image-e1537456990695.png'),
        //     Icon(Icons.more_vert)
        //   ],
        // ),
        trailing: Image.network('https://as.ftcdn.net/r/v1/pics/7b11b8176a3611dbfb25406156a6ef50cd3a5009/home/discover_collections/optimized/image-2019-10-11-11-36-27-681.jpg', height: 50, width: 100,),
        
      );
    },
  );
}