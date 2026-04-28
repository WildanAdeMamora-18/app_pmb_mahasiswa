import 'package:flutter/material.dart';

Widget announcementCard() {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 5),
      ],
    ),
    child: Row(
      children: [
        Icon(Icons.campaign, size: 40, color: Colors.blue),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "PMB Gelombang 1 Dibuka!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "Segera daftar sebelum kuota penuh",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        )
      ],
    ),
  );
}