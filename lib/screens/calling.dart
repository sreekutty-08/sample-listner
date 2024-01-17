import 'dart:async';
import 'package:flutter/material.dart';
import 'package:listners_app/screens/home.dart';
import 'package:listners_app/screens/homescreens/vediocalling.dart';

class Calling extends StatefulWidget {
  final String personName;
  final String profileImageUrl;

  const Calling({
    Key? key,
    required this.personName,
    required this.profileImageUrl,
    required List language,
    required List languages,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CallingState createState() => _CallingState();
}

class _CallingState extends State<Calling> {
  bool isVideoCall = false;
  late Timer _timer;
  int _seconds = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String durationText = 'Call Duration: ${_seconds ~/ 60}:${_seconds % 60}';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false, // Remove back button
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(widget.profileImageUrl),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.personName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    durationText,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.bluetooth,
                    color: Colors.white,
                    size: 36,
                  ),
                  const Icon(
                    Icons.volume_up,
                    color: Colors.white,
                    size: 36,
                  ),
                  const Icon(
                    Icons.mic,
                    color: Colors.white,
                    size: 36,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.videocam,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoCalling(
                            personName: widget.personName,
                            profileImageUrl: widget.profileImageUrl,
                          ),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.call_end,
                      color: Colors.red,
                      size: 64,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const Home(
                            languages: [],
                            language: [],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
