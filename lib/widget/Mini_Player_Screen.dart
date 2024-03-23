// import 'package:flutter/material.dart';
// import 'package:goorani/models/colorstyle.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';



// class MiniPlayerScreen extends StatefulWidget {
//   @override
//   _MiniPlayerScreenState createState() => _MiniPlayerScreenState();
// }

// class _MiniPlayerScreenState extends State<MiniPlayerScreen> {
//   bool isPlaying = false;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: SlidingUpPanel(
//         minHeight: 70.0,
//         maxHeight: MediaQuery.of(context).size.height,
//         panelBuilder: (sc) => _buildPanel(sc),
//         // body: _buildContent(),
        
//       ),
//     );
//   }

// Widget _buildPanel(ScrollController sc) {
//   return Container(
//     color: const ColorStyle().colorYellow,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Add your player controls here
//         ListTile(
//           leading: ClipOval(child: Image.network('https://cdn.avvangmusic.ir/poster/19fcda8e-a4f1-4be4-b234-024404000b47.webp')),
//           title: const Text('Song Title',style: TextStyle(fontSize: 8),),
//           subtitle: const Text('Artist Name',style: TextStyle(fontSize: 8),),
//           trailing: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.skip_previous_outlined),
//                 onPressed: () {
//                   // Handle skip previous
//                 },
//               ),
//               IconButton(
//                 icon: Icon(
//                   isPlaying ? Icons.pause : Icons.play_circle_outline_rounded,
//                   size: 35.0,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     isPlaying = !isPlaying;
//                     // Add your play/pause logic here
//                   });
//                 },
//               ),
//               IconButton(
//                 icon: const Icon(Icons.skip_next_outlined),
//                 onPressed: () {
//                   // Handle skip next
//                 },
//               ),
//             ],
//           ),
//         ),
//         // Add additional controls or information as needed
//         // const MyBottomNavigationBar(),
//       ],
//     ),
//   );
// }

// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goorani/screen/player.dart';
import '../models/colorstyle.dart';

class MiniPlayerScreen extends StatefulWidget {
  const MiniPlayerScreen({super.key});

  @override
  State<MiniPlayerScreen> createState() => _MiniPlayerScreenState();
}

class _MiniPlayerScreenState extends State<MiniPlayerScreen> {
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: (){
          Get.to(const Player());
        },
        child: Container(
        color: const ColorStyle().colorYellow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add your player controls here
            ListTile(
              leading: ClipOval(child: Image.network('https://cdn.avvangmusic.ir/poster/19fcda8e-a4f1-4be4-b234-024404000b47.webp')),
              title: const Text('Song Title',style: TextStyle(fontSize: 8),),
              subtitle: const Text('Artist Name',style: TextStyle(fontSize: 8),),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.skip_previous_outlined),
                    onPressed: () {
                      // Handle skip previous
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_circle_outline_rounded,
                      size: 35.0,
                    ),
                    onPressed: () {
                      setState(() {
                        isPlaying = !isPlaying;
                        // Add your play/pause logic here
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_next_outlined),
                    onPressed: () {
                      // Handle skip next
                    },
                  ),
                ],
              ),
            ),
            // Add additional controls or information as needed
            // const MyBottomNavigationBar(),
          ],
        ),
          ),
      ),
    );
  }
}