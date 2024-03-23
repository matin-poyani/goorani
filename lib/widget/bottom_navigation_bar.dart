import 'package:flutter/material.dart';
import 'package:goorani/models/colorstyle.dart';
import 'package:goorani/screen/explore.dart';
import 'package:goorani/screen/home.dart';

import '../screen/profile.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const ColorStyle().colorSilverGray,
      selectedItemColor: const ColorStyle().colorYellow,
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
        switch (index) {
          // default:
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Explorer()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profile()),
            );
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:goorani/screen/profile.dart';
// import 'package:miniplayer/miniplayer.dart';

// import '../models/colorstyle.dart';
// import 'explore.dart';
// import 'home.dart';

// class MyBottomNavigationBar extends StatefulWidget {
//   @override
//   _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
// }

// class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
//   final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
//   int _currentIndex = 0;

// final List<Widget> _pages = [
//   const Home(),
//   const Explorer(),
//   const Profile(),
// ];
//  @override
// Widget build(BuildContext context) {
//   return MiniplayerWillPopScope(
//     onWillPop: () async {
//       final NavigatorState? navigator = _navigatorKey.currentState;
//       if (!navigator!.canPop()) return true;
//       navigator.pop();
//       return false;
//     },
//     child: Scaffold(
//       body: IndexedStack(
//         index: _currentIndex,
//         children: _pages,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: const ColorStyle().colorSilverGray,
//         selectedItemColor: const ColorStyle().colorYellow,
//         currentIndex: _currentIndex,
//         onTap: (int index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_filled),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.explore),
//             label: 'explore',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     ),
//   );
// }
// }
