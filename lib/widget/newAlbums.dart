import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


// ignore: camel_case_types
class newAlbums extends StatefulWidget {
  const newAlbums({super.key});

  @override
  State<newAlbums> createState() => _newAlbumsState();
}


// ignore: camel_case_types
class _newAlbumsState extends State<newAlbums> {

  final List<String> albumMusicList = [
    'https://musicsweb.ir/wp-content/uploads/2023/05/avat-bokani-delam-deli-musicsweb.ir_.jpg',
    'https://musicsweb.ir/wp-content/uploads/2023/05/avat-bokani-delam-deli-musicsweb.ir_.jpg'
        'https://musicsweb.ir/wp-content/uploads/2023/05/avat-bokani-delam-deli-musicsweb.ir_.jpg'
        'https://musicsweb.ir/wp-content/uploads/2023/05/avat-bokani-delam-deli-musicsweb.ir_.jpg'
  ];


  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                'New Albums',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold, // fontSize: ,
                    color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  // ignore: todo
                  //TODO... view all music album...
                },
                child: const Text(
                  'View All',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 16,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          //card view in album...TODO...
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 15 / 11,
              enlargeCenterPage: true,
              autoPlayCurve: Curves.decelerate,
            ),
            items: albumMusicList
                .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                      Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item,
                          fit: BoxFit.cover,
                          width: double.infinity),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),

                          // text cover album music...

                          // child: Text(
                          //   'No. ${albumMusicList.indexOf(item)} image',
                          //   style: const TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 16.0,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                        ),
                      ),
                    ],
                  )),
            ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
