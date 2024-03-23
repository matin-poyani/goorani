import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:goorani/widget/bottom_navigation_bar.dart';
import 'package:goorani/widget/Mini_Player_Screen.dart';
import '../models/colorstyle.dart';
import '../widget/Recently_Music.dart';
// import '../widget/mini_player.dart';
import '../widget/new_albums.dart';
import '../widget/searchbar.dart';
import '../widget/weekleymusic.dart';
=======
import 'package:goorani/widget/newAlbums.dart';
import 'package:goorani/widget/weekleyMusic.dart';

import '../models/colorstyle.dart';
import '../widget/recentlyMusic.dart';

>>>>>>> 9e54a20 (music gorani player)
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

<<<<<<< HEAD
class _HomeState extends State<Home> {
=======
class _HomeState extends State<Home> with WidgetsBindingObserver {


>>>>>>> 9e54a20 (music gorani player)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const ColorStyle().colorBlack,
      appBar: AppBar(
        actions: const [MySearchBar()],
      ),
<<<<<<< HEAD
      bottomNavigationBar:  const MyBottomNavigationBar(),
      bottomSheet: const MiniPlayerScreen(),
      body: SingleChildScrollView(
=======
      body:  const SingleChildScrollView(
>>>>>>> 9e54a20 (music gorani player)
        child: Column(
          children: [
<<<<<<< HEAD
            // Your other widgets ...
            //class newAlbums...
            const NewAlbums(),
            //weekley music
            weekleyMusic(),
            //Recently Music
              weekleyMusic(),
                weekleyMusic(),
            const RecentlyMusic(),
            
=======
            //class newAlbums...
            newAlbums(),
            //class weekleyMusic
            weeklyMusic(),
            //class weekleyMusic
            recentlyMusic(),

>>>>>>> 9e54a20 (music gorani player)
          ],
        ),
      ),
    );
  }
}
