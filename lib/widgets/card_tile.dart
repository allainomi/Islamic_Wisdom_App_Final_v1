import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  final String titleU;
  final String titleE;
  final String icon;
  final VoidCallback onTap;
  CardTile({required this.titleU, required this.titleE, required this.icon, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          elevation: 3,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), gradient: LinearGradient(colors: [Color(0xFF0B4F88), Color(0xFF1E6FB3)])),
            padding: EdgeInsets.all(12),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(icon, style: TextStyle(fontSize:22)),
              Spacer(),
              Text(titleU, style: TextStyle(color: Colors.white, fontSize:16, fontWeight: FontWeight.bold)),
              SizedBox(height:4),
              Text(titleE, style: TextStyle(color: Colors.white70, fontSize:12)),
            ]),
          ),
        ),
      ),
    );
  }
}
