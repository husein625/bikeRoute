import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:video_player/video_player.dart';

class ProfileCardAlignment extends StatefulWidget {
  final int cardNum;
  ProfileCardAlignment(this.cardNum);

  @override
  _ProfileCardAlignmentState createState() => _ProfileCardAlignmentState();
}

class _ProfileCardAlignmentState extends State<ProfileCardAlignment> {

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
//      margin:EdgeInsets.only(
//              top:MediaQuery.of(context).size.height * 0.000005,
//              right:MediaQuery.of(context).size.height * 0.0001,
//              left:MediaQuery.of(context).size.height * 0.0001,
//            ),
//      height:MediaQuery.of(context).size.height * 0.5,
      child: Card(
        child: Stack(
          children: <Widget>[
            SizedBox.expand(
              child: Padding(
                padding: const EdgeInsets.only(bottom:120),
                child: Material(
                  borderRadius: BorderRadius.circular(12.0),
//         child: Image.asset('res/portrait.jpeg', fit: BoxFit.cover),
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        VideoPlayer(_controller),
                        ClosedCaption(text: _controller.value.caption.text),
//                    _PlayPauseOverlay(controller: _controller),
                        VideoProgressIndicator(_controller, allowScrubbing: true),
                      ],
                    ),
                  ),



                ),
              ),
            ),

            Container(
              child: Padding(
                padding: EdgeInsets.only(top:280),
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
