// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlay extends StatefulWidget {
//   @override
//   _VideoPlayState createState() => _VideoPlayState();
// }

// class _VideoPlayState extends State<VideoPlay> {
//    VideoPlayerScreen({Key key}) : super(key: key);

//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   VideoPlayerController _controller;
//   Future<void> _initializeVideoPlayerFuture;

//   @override
//   void initState() {
//     // Create and store the VideoPlayerController. The VideoPlayerController
//     // offers several different constructors to play videos from assets, files,
//     // or the internet.
//     _controller = VideoPlayerController.network(
//       'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
//     );

//     // Initialize the controller and store the Future for later use.
//     _initializeVideoPlayerFuture = _controller.initialize();

//     // Use the controller to loop the video.
//     _controller.setLooping(true);

//     super.initState();
//   }

//   @override
//   void dispose() {
//     // Ensure disposing of the VideoPlayerController to free up resources.
//     _controller.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: _initializeVideoPlayerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             // If the VideoPlayerController has finished initialization, use
//             // the data it provides to limit the aspect ratio of the video.
//             return AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               // Use the VideoPlayer widget to display the video.
//               child: VideoPlayer(_controller),
//             );
//           } else {
//             // If the VideoPlayerController is still initializing, show a
//             // loading spinner.
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Wrap the play or pause in a call to `setState`. This ensures the
//           // correct icon is shown.
//           setState(() {
//             // If the video is playing, pause it.
//             if (_controller.value.isPlaying) {
//               _controller.pause();
//             } else {
//               // If the video is paused, play it.
//               _controller.play();
//             }
//           });
//         },
//         // Display the correct icon depending on the state of the player.
//         child: Icon(
//           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       ), /
//     );
//   }
// }



import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:share/share.dart';



class VideoPlayerScreen extends StatefulWidget {
  var data, i;
  VideoPlayerScreen(this.data, this.i);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState(data, i);
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  var likes = 0, dislikes = 0;
  var data, i;
  _VideoPlayerScreenState(this.data, this.i);

  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  videoFunction() {
    _controller = VideoPlayerController.network(
      'https'+data[i]['VideoURL'].substring(4),
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  void initState() {
    // // Create and store the VideoPlayerController. The VideoPlayerController
    // // offers several different constructors to play videos from assets, files,
    // // or the internet.
    // _controller = VideoPlayerController.network(
    //   'https'+data[i]['VideoURL'].substring(4),
    // );

    // // Initialize the controller and store the Future for later use.
    // _initializeVideoPlayerFuture = _controller.initialize();

    // // Use the controller to loop the video.
    // _controller.setLooping(true);
    // _controller.play();
    videoFunction();

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              child: Stack(
                children: <Widget>[
                  GestureDetector(
                    child: FutureBuilder(
                      future: _initializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          // If the VideoPlayerController has finished initialization, use
                          // the data it provides to limit the aspect ratio of the video.
                          return AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            // Use the VideoPlayer widget to display the video.
                            child: VideoPlayer(_controller),
                          );
                        } else {
                          // If the VideoPlayerController is still initializing, show a
                          // loading spinner.
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                    onTap: () {
                      setState(() {
                        // If the video is playing, pause it.
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          // If the video is paused, play it.
                          _controller.play();
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  ListTile(
                    title: Text(data[i]['Title'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    trailing: Icon(Icons.arrow_drop_down),
                  ),
                  Text('    ' + data[i]['Views'] + ' Views', style: TextStyle(fontSize: 13),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {setState(() {
                              likes++;
                              dislikes > 0 ? dislikes-- : null;
                            });},
                            icon: Icon(Icons.thumb_up), color: likes > 0 ? Colors.blue : Colors.grey,
                          ),
                          Text(likes.toString(), style: TextStyle(fontSize: 15),)
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {setState(() {
                              dislikes++;
                              likes > 0 ? likes-- : null; 
                            });},
                            icon: Icon(Icons.thumb_down), color: dislikes > 0 ? Colors.blue : Colors.grey,
                          ),
                          Text(dislikes.toString(), style: TextStyle(fontSize: 15),)
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {Share.share('${data[i]['Title']}\n${data[i]['VideoURL']}');},
                            icon: Icon(Icons.share), color: Colors.grey,
                          ),
                          Text('Share', style: TextStyle(fontSize: 15),)
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.file_download), color: Colors.grey,
                          ),
                          Text('Download', style: TextStyle(fontSize: 15),)
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.library_add), color: Colors.grey,
                          ),
                          Text('Save', style: TextStyle(fontSize: 15),)
                        ],
                      )
                    ],
                  ),
                  Divider(thickness: 1,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(data[i]['ProfileiconURL']),
                      ),
                      Column(
                        children: <Widget>[
                          Text(data[i]['Name'], style: TextStyle(fontSize: 20)),
                          Text('10M subscribers', style: TextStyle(fontSize: 10)),
                        ],
                      ),
                      Text('SUBSCRIBED', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 16)),
                      Icon(Icons.notifications, color: Colors.grey,)
                    ],
                  ),
                  Divider(thickness: 1,),

                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.network(data[index]['ThumbmnilURL'], height: 200,),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(data[index]['Title']),
                            Text('${data[index]['Name']}\n${data[index]['Day']} . ${data[index]['Views']}', style: TextStyle(fontSize: 14, color: Colors.grey),),
                          ],                          
                        ),
                        trailing: Icon(Icons.more_vert),
                        onTap: () {
                          setState(() {
                            _controller.pause();
                            i = index;
                            videoFunction();
                          });
                          // Navigator.push(context, 
                          //   MaterialPageRoute(builder: (context) => VideoPlayerScreen(data, index))
                          // );
                        },
                      );
                    }
                  )                 
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}