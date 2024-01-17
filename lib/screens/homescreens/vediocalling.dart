import 'package:flutter/material.dart';

class VideoCalling extends StatelessWidget {
  final String personName;
  final String profileImageUrl;

  const VideoCalling({
    Key? key,
    required this.personName,
    required this.profileImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Video Calling'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.call_end, color: Colors.red),
            onPressed: () {
              // Handle end call button press
              Navigator.pop(context); // Navigate back to the home page
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(profileImageUrl),
          ),
          const SizedBox(height: 16),
          Text(
            personName,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 32),
          // Video player area (Replace this with your video player implementation)
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Video Player',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.flip_camera_ios, color: Colors.white),
                onPressed: () {
                  // Handle camera rotating button press
                },
              ),
              IconButton(
                icon: const Icon(Icons.videocam_off, color: Colors.white),
                onPressed: () {
                  // Handle video mute button press
                },
              ),
              IconButton(
                icon: const Icon(Icons.mic_off, color: Colors.white),
                onPressed: () {
                  // Handle mic mute button press
                },
              ),
              IconButton(
                icon: const Icon(Icons.call_end, color: Colors.red),
                onPressed: () {
                  // Handle end call button press
                  Navigator.pop(context); // Navigate back to the home page
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: VideoCalling(
        personName: 'Athira',
        profileImageUrl: 'assets/images/photo.jpg',
      ),
    ),
  );
}
