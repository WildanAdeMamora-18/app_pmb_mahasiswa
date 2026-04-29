import 'package:flutter/material.dart';

class RadioGender extends StatelessWidget {
    final String? value;
    final Function(String?) onChanged;

    const RadioGender({
        super.key,
        required this.value,
        required this.onChanged,
    });

    @override
    Widget build(BuildContext context) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(
                    "Jenis Kelamin",
                    style: TextStyle(fontWeight: FontWeight.w600),
                ),

                Row(
                    children: [
                        Expanded(
                            child: RadioListTile<String>(
                                title: Text("Laki-laki"),
                                value: "Laki-laki",
                                groupValue: value,
                                onChanged: onChanged,
                            ),
                        ),
                        Expanded(
                            child: RadioListTile<String>(
                                title: Text("Perempuan"),
                                value: "Perempuan",
                                groupValue: value,
                                onChanged: onChanged,
                            ),
                        ),
                    ],
                ),
            ],
        );
    }
}