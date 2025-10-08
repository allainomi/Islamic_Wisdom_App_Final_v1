import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Islamic Wisdom', style: TextStyle(fontSize:18, fontWeight: FontWeight.bold)),
          SizedBox(height:8),
          Text('Presented by Hafiz Mufti Muhammad Shuaib Khan Alai'),
          SizedBox(height:8),
          Text('Website: IslamicWisdomHub.wordpress.com'),
        ]),
      ),
    );
  }
}
