import 'package:flutter/material.dart';

class DropdownProdi extends StatelessWidget
{
    final String title;
    final String? value;
    final Function(String?) onChanged;

    DropdownProdi({
        required this.title, 
        this.value, 
        required this.onChanged
    });

    final List<String> prodi = [
        "Teknik Elektro",
        "Teknik Informatika",
        "Sistem Informasi",
        "Teknik Mesin",
        "Teknik Sipil",
        "Teknik Kimia",
        "Teknik Industri",
        "Teknik Lingkungan",
        "Teknik Geologi",
        "Teknik Kelautan",
        "Teknik Pertambangan",
        "Manajemen",
        "Akuntansi"
    ];

    @override
    Widget build(BuildContext context)
    {
        return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                        ),
                    ),

                    SizedBox(height: 6,),

                    DropdownButtonFormField<String>(
                        value: value,
                        decoration: InputDecoration(
                            labelText: "Program Studi",
                            border: OutlineInputBorder(),
                        ),
                        items: prodi
                            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: onChanged,
                    ),
                ],
            ),
        );
    }
}
