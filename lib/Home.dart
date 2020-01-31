import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:http/http.dart' as http;
import 'package:youtube/VideoPlay.dart';
import 'Trending.dart';
import 'Subscriptions.dart';
import 'Inbox.dart';
import 'Library.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {  
  int _currentIndex = 0;

  var homeUrl = 'http://userapi.tk/youtube/';
  var trendingUrl = 'http://userapi.tk/youtube/trending';
  var subscriptionsgUrl = 'http://userapi.tk/youtube/subscription';
  var homeData;
  var trendingData;
  var subscriptionsData;

  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark);
    DynamicTheme.of(context).setThemeData(Theme.of(context).brightness == Brightness.dark?  ThemeData(
      primarySwatch: Colors.indigo,
      appBarTheme: AppBarTheme(
        color: Colors.white
      ) 
    ) 
    : ThemeData.dark()
    
    );
  }

  Future<String> getJsonData() async {
    var hresponse = await http.get(Uri.encodeFull(homeUrl));
    var tresponse = await http.get(Uri.encodeFull(trendingUrl));
    var sresponse = await http.get(Uri.encodeFull(subscriptionsgUrl));
    setState(() {
      homeData = json.decode(hresponse.body);
      trendingData = json.decode(tresponse.body);
      subscriptionsData= json.decode(sresponse.body);
    });
    print(homeData);
  }

  initState() {
    getJsonData();
    super.initState();
  }
  
  Widget Home() {
    if (homeData == null) {
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
    } else {
      return ListView.builder(
        itemCount: homeData == null ? 0 : homeData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Column(
              children: <Widget>[
                Container(width: double.infinity, child: Image.network(homeData[index]['ThumbmnilURL'], fit: BoxFit.cover,)),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(homeData[index]['ProfileiconURL']),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(homeData[index]['Title'], style: TextStyle(fontSize: 18),),
                      Text('${homeData[index]['Name']} . ${homeData[index]['Views']} . ${homeData[index]['Day']}', style: TextStyle(fontSize: 13, color: Colors.grey)),
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
                MaterialPageRoute(builder: (context) => VideoPlayerScreen(homeData, index))
              );
            },
          );
        },
      );
    }
  }

  Widget bodySelector() {
    switch (_currentIndex) {
      case 0:
        return Home();
        break;
      case 1:
        return Trending(trendingData);
        break;
      case 2:
        return Subscriptions(subscriptionsData);
        break;
      case 3:
        return Inbox();
        break;
      case 4:
        return Library(changeBrightness);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: Container(
          height: 27,
          width: 130,
          child: Image.network('https://darkeandtaylor.co.uk/wp/wp-content/uploads/2018/09/youtube-logo-png-transparent-image-e1537456990695.png'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam, color: Colors.grey[500], size: 25,),
            onPressed: () {},
          ),
          Padding(padding: EdgeInsets.only(left: 3),),
          IconButton(
            icon: Icon(Icons.search, color: Colors.grey[500], size: 25,),
            onPressed: () {},
          ),
          Padding(padding: EdgeInsets.only(left: 3),),
          CircleAvatar(
            backgroundColor: Colors.teal,
            child: Text('S', style: TextStyle(color: Colors.white, fontSize: 15)),
            radius: 12,
          ),
          Padding(padding: EdgeInsets.only(left: 10),)
        ],
      ),      
      body: bodySelector(),        
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            title: Text('Trending'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            title: Text('Subscriptions'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Inbox'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            title: Text('Library'),
          ),
        ],
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.grey[500],
        selectedItemColor: Colors.red,
        showUnselectedLabels: true,
        onTap: (int i) {
          setState(() {
            _currentIndex = i;
          });
        },
      ),
    );
  }
}