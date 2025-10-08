import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class QuranView extends StatefulWidget {
  @override
  _QuranViewState createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  List verses = [];
  String suraName = 'الفاتحہ';
  int sura = 1;

  @override
  void initState() {
    super.initState();
    loadSura(sura);
  }

  Future<void> loadSura(int s) async {
    final path = 'assets/quran_data/sura_${s.toString().padLeft(3,'0')}.json';
    try {
      final raw = await rootBundle.loadString(path);
      final data = jsonDecode(raw);
      setState((){
        verses = data['ayahs'];
        suraName = data['name_ur'] ?? data['name_ar'] ?? 'Sura';
      });
    } catch (e) {
      setState(()=> verses = [{'index':1,'arabic':'(sample)','translation_ur':'Sample Urdu translation not found','translation_en':'Sample English translation not found'}]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('قرآن / Quran - ' + suraName)),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: verses.length,
        itemBuilder: (context, index){
          final v = verses[index];
          return Card(
            child: Padding(padding: EdgeInsets.all(12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(v['arabic'] ?? '', textAlign: TextAlign.right, style: TextStyle(fontSize: 20, fontFamily: 'Amiri')),
              SizedBox(height:8),
              Text(v['translation_ur'] ?? '', style: TextStyle(fontSize: 16)),
              SizedBox(height:6),
              Text(v['translation_en'] ?? '', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
            ])),
          );
        }
      ),
    );
  }
}
