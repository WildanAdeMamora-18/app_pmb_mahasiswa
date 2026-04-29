import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TempatTanggalLahir extends StatelessWidget
{
  final String title;
  final String hint;
  final TextEditingController tempatLahirController;
  final TextEditingController tanggalLahirController;
  final Function(DateTime) onDateSelected;

  const TempatTanggalLahir({
    super.key,
    required this.title,
    required this.hint,
    required this.tempatLahirController,
    required this.tanggalLahirController,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
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

          SizedBox(height: 6),

          Row(
            children: [
              // Tempat Lahir
              Expanded(
                child: TextFormField(
                  controller: tempatLahirController,
                  decoration: InputDecoration(
                    hintText: 'Tempat Lahir',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              SizedBox(width: 10,),

              //Tanggal Lahir
              Expanded(
                child: TextFormField(
                  controller: tanggalLahirController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'Tanggal Lahir',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000),
                      firstDate: DateTime(1980),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      tanggalLahirController.text =
                          DateFormat('dd/MM/yyyy').format(pickedDate);

                      onDateSelected(pickedDate);
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
