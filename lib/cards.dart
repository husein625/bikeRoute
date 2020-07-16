import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class ProfileCardDraggable extends StatefulWidget {
  final int cardNum;
  ProfileCardDraggable(this.cardNum);

  @override
  _ProfileCardDraggableState createState() => _ProfileCardDraggableState();
}

class _ProfileCardDraggableState extends State<ProfileCardDraggable> {
  VideoPlayerController _controller;

  @override
  void initState() {

    super.initState();
    _controller = VideoPlayerController.asset('assets/Motocross.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
        child: Container(
//       height: MediaQuery.of(context).size.height / 5,
          child: Padding(
            padding: EdgeInsets.only(top:240),
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
          ),
        ),

//      child: Column(
//
//
//        mainAxisAlignment: MainAxisAlignment.start,
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
////          Expanded(
//////            child: Image.asset('res/portrait.jpeg', fit: BoxFit.cover),
////            child: AspectRatio(
////              aspectRatio: _controller.value.aspectRatio,
////              child: Stack(
////                alignment: Alignment.bottomCenter,
////                children: <Widget>[
////                  VideoPlayer(_controller),
////                  ClosedCaption(text: _controller.value.caption.text),
//////                    _PlayPauseOverlay(controller: _controller),
////                  VideoProgressIndicator(_controller, allowScrubbing: true),
////                ],
////              ),
////            ),
////
////
////          ),
//          Container(
////              padding: EdgeInsets.symmetric(vertical: 42.0, horizontal: 10.0),
////           height: MediaQuery.of(context).size.height * 0.05,
//            //margin: EdgeInsets.only(top: 53),
//            padding: EdgeInsets.only(
//              top:MediaQuery.of(context).size.height * 0.05,
//              right:MediaQuery.of(context).size.height * 0.005,
//            ),
//
//            child: GoogleMap(
//
//              onMapCreated: _onMapCreated,
//              initialCameraPosition: CameraPosition(
//                target: _center,
//                zoom: 11.0,
//              ),
//            ),
//
//          )
//
//
//        ],
//      ),
      ),
    );
  }
}
//
//

