import 'package:flutter/material.dart';

Widget menuCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
})
{
    return GestureDetector(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 5),
                ],
            ),
            child: Column(
                children: [
                    Icon(icon, size: 40, color: Colors.blue),
                    SizedBox(height: 10),
                    Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12),
                    ),
                ],
            ),
        ),
    );
}
