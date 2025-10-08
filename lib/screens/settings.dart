import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final ThemeMode themeMode;
  final double fontSize;
  final Locale locale;
  SettingsScreen({required this.themeMode, required this.fontSize, required this.locale});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late ThemeMode _themeMode;
  late double _fontSize;
  late Locale _locale;

  @override
  void initState() {
    super.initState();
    _themeMode = widget.themeMode;
    _fontSize = widget.fontSize;
    _locale = widget.locale;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(children: [
          ListTile(
            title: Text('Theme Mode'),
            trailing: DropdownButton<ThemeMode>(value: _themeMode, items:[DropdownMenuItem(child: Text('Light'), value: ThemeMode.light), DropdownMenuItem(child: Text('Dark'), value: ThemeMode.dark)], onChanged: (v){ if(v!=null) setState(()=> _themeMode=v);}),
          ),
          ListTile(
            title: Text('Font Size'),
            trailing: DropdownButton<double>(value: _fontSize, items:[1.0,1.2,1.4,1.6].map((e)=> DropdownMenuItem(child: Text(e.toString()), value: e)).toList(), onChanged: (v){ if(v!=null) setState(()=> _fontSize=v);}),
          ),
          ListTile(
            title: Text('Language Preference'),
            trailing: DropdownButton<Locale>(value: _locale, items:[Locale('ur'), Locale('en')].map((e)=> DropdownMenuItem(child: Text(e.languageCode), value: e)).toList(), onChanged: (v){ if(v!=null) setState(()=> _locale=v);}),
          ),
          SizedBox(height:20),
          ElevatedButton(onPressed: ()=> Navigator.pop(context, {'themeMode':_themeMode,'fontSize':_fontSize,'locale':_locale}), child: Text('Save'))
        ],),
      ),
    );
  }
}
