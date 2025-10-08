import 'dart:convert';
import 'package:flutter/material.dart';
import '../widgets/card_tile.dart';
import 'quran_view.dart';
import 'about.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onOpenSettings;
  HomeScreen({required this.onOpenSettings});

  final List<Map<String,dynamic>> menu = [
    {'u':'قرآن','e':'Quran','icon':'📖','route':'quran'},
    {'u':'تفسیر','e':'Tafseer','icon':'📚','route':'tafseer'},
    {'u':'حدیث','e':'Hadith','icon':'📜','route':'hadith'},
    {'u':'فقہ','e':'Fiqh','icon':'⚖️','route':'fiqh'},
    {'u':'اخلاقیات','e':'Akhlaq','icon':'🌿','route':'akhlaq'},
    {'u':'بچوں کے لیے','e':'Kids','icon':'👶','route':'kids'},
    {'u':'سیرت النبی ﷺ','e':'Seerah','icon':'🌙','route':'seerah'},
    {'u':'فتاویٰ','e':'Fatawa','icon':'💬','route':'fatawa'},
    {'u':'اسلامی کہانیاں','e':'Stories','icon':'📔','route':'stories'},
    {'u':'اسلام کا چہرہ','e':'Beauty of Islam','icon':'💎','route':'beauty'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF012244), Color(0xFF0B4F88)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height:12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيم', style: TextStyle(color: Colors.white70)),
                      SizedBox(height:6),
                      Text('Islamic Wisdom', style: TextStyle(color: Colors.white, fontSize:26, fontWeight: FontWeight.bold)),
                      SizedBox(height:4),
                      Text('Guided by Light of Quran', style: TextStyle(color: Colors.white70)),
                    ]),
                    Spacer(),
                    IconButton(onPressed: onOpenSettings, icon: Icon(Icons.settings, color: Colors.white))
                  ],
                ),
              ),
              SizedBox(height:12),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3/2, crossAxisSpacing: 12, mainAxisSpacing: 12),
                      itemCount: menu.length,
                      itemBuilder: (context, index){
                        final it = menu[index];
                        return CardTile(titleU: it['u'], titleE: it['e'], icon: it['icon'], onTap: (){
                          if (it['route']=='quran') {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => QuranView()));
                          } else if (it['route']=='beauty') {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => AboutPage()));
                          } else {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> Scaffold(appBar: AppBar(title: Text(it['e'])), body: Center(child: Text('Content will be added here', style: TextStyle(fontSize: 16))))));
                          }
                        });
                      }
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
