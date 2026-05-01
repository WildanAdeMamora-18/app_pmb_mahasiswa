import 'package:flutter/material.dart';
import '../widgets/input_text.dart';

class DataPendidikan extends StatelessWidget
{
  final TextEditingController asalSekolahController;
  final TextEditingController tahunLulusController;
  final TextEditingController jurusanController;
  final String? Function(String?)? validator;

  const DataPendidikan({
    super.key,
    required this.asalSekolahController,
    required this.tahunLulusController,
    required this.jurusanController,
    this.validator,
});

  @override
  Widget build(BuildContext context)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Data Pendidikan",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 10),

        CustomTextField(
          title: "Asal Sekolah",
          hint: "Masukkan Asal Sekolah",
          controller: asalSekolahController,
          validator: validator,
        ),

        CustomTextField(
          title: "Tahun Lulus",
          hint: "Masukkan Tahun Lulus",
          controller: tahunLulusController,
          validator: validator,
          keyboardType: TextInputType.number,
        ),

        CustomTextField(
            title: "Jurusan",
            hint: "Masukkan Jurusan",
            validator: validator,
            controller: jurusanController,
        )
      ],
    );
  }
}
