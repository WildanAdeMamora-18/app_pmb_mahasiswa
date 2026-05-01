import 'package:flutter/material.dart';
import '../widgets/input_text.dart';
import '../widgets/dropdown_prodi.dart';
import '../widgets/button_submit.dart';
import '../widgets/tempat_tanggal_lahir.dart';
import '../widgets/radio_gender.dart';
import '../widgets/form_section.dart';
import '../widgets/data_pendidikan.dart';
import 'dart:io';
import '../widgets/upload_image_field.dart';
import '../utils/validators.dart';

class FormPMBScreen extends StatefulWidget
{
    @override
    _FormPMBScreenState createState() => _FormPMBScreenState();
}

class _FormPMBScreenState extends State<FormPMBScreen>
{
    // State
    final formKey = GlobalKey<FormState>();

    String? prodi;
    String? gender;
    File? ktpImage;
    File? kkImage;
    File? ijazahImage;

    // Controller
    TextEditingController namaController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController nikController = TextEditingController();
    TextEditingController tempatLahirController = TextEditingController();
    TextEditingController tanggalLahirController = TextEditingController();
    TextEditingController alamatController = TextEditingController();
    TextEditingController noHandphoneController = TextEditingController();
    TextEditingController asalSekolahController = TextEditingController();
    TextEditingController tahunLulusController = TextEditingController();
    TextEditingController jurusanController = TextEditingController();

    // PopUp UI
    void showModernDialog({
        required String title,
        required List<String> messages,
        bool isSuccess = false,
    }) {
        showDialog(
            context: context,
            builder: (context) => Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                            Icon(
                                isSuccess ? Icons.check_circle : Icons.error,
                                color: isSuccess ? Colors.green : Colors.red,
                                size: 60,
                            ),
                            SizedBox(height: 12),
                            Text(
                                title,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                ),
                            ),
                            SizedBox(height: 12),

                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: messages.map((msg) {
                                    return Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Text("• "),
                                            Expanded(child: Text(msg)),
                                        ],
                                    );
                                }).toList(),
                            ),

                            SizedBox(height: 20),

                            SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                        isSuccess ? Colors.green : Colors.red,
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    child: Text("OK", style:TextStyle(color: Colors.white),),
                                ),
                            )
                        ],
                    ),
                ),
            ),
        );
    }

    // Global Validation
    bool validateGlobal() {
        List<String> errors = [];

        if (namaController.text.isEmpty) {
            errors.add("Nama wajib diisi");
        }

        if (nikController.text.length != 16) {
            errors.add("NIK harus 16 digit");
        }

        if (tempatLahirController.text.isEmpty) {
            errors.add("Tempat lahir wajib diisi");
        }

        if (tanggalLahirController.text.isEmpty) {
            errors.add("Tanggal lahir wajib diisi");
        }

        if (emailController.text.isEmpty) {
            errors.add("Email wajib diisi");
        }

        if (noHandphoneController.text.isEmpty) {
            errors.add("No HP wajib diisi");
        }

        if (alamatController.text.isEmpty) {
            errors.add("Alamat wajib diisi");
        }

        if (asalSekolahController.text.isEmpty) {
            errors.add("Asal sekolah wajib diisi");
        }

        if (tahunLulusController.text.isEmpty) {
            errors.add("Tahun lulus wajib diisi");
        }

        if (jurusanController.text.isEmpty) {
            errors.add("Jurusan wajib diisi");
        }

        if (gender == null) {
            errors.add("Pilih jenis kelamin");
        }

        if (prodi == null) {
            errors.add("Pilih program studi");
        }

        if (ktpImage == null) {
            errors.add("Upload KTP");
        }

        if (kkImage == null) {
            errors.add("Upload Kartu Keluarga");
        }

        if (ijazahImage == null) {
            errors.add("Upload Ijazah");
        }

        if (errors.isNotEmpty) {
            showModernDialog(
                title: "Data Belum Lengkap",
                messages: errors,
                isSuccess: false,
            );
            return false;
        }

        return true;
    }

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text('Form Penerimaan Mahasiswa Baru',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                    ),),
                backgroundColor: Colors.blueAccent,
            ),
            body: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Form(
                    key: formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                            // 🔹 Inputan Data Diri
                            formSection(
                                title: "Data Pribadi",
                                children: [
                                    // Inputan Nama
                                    CustomTextField(
                                        title: "Nama",
                                        hint: "Masukkan Nama Lengkap",
                                        controller: namaController,
                                        validator: Validators.name,
                                    ),

                                    // Inputan NIK
                                    CustomTextField(
                                        title: "NIK",
                                        hint: "Masukkan NIK",
                                        controller: nikController,
                                        validator: Validators.nik,
                                    ),

                                    // Tempat & Tanggal Lahir
                                    TempatTanggalLahir(
                                        title: "Tempat & Tanggal Lahir",
                                        hint: "Masukkan Tempat & Tanggal Lahir",
                                        tempatLahirController: tempatLahirController,
                                        tanggalLahirController: tanggalLahirController,
                                        onDateSelected: (date)
                                        {
                                            print("Tanggal Lahir: $date");
                                        },
                                    ),

                                    // Jenis Kelamin
                                    RadioGender(
                                        value: gender,
                                        onChanged: (value)
                                        {
                                            setState(()
                                                {
                                                    gender = value;
                                                }
                                            );
                                        },
                                    ),
                                ]
                            ),

                            // 🔹 Inputan Kontak
                            formSection(
                                title: "Kontak",
                                children: [
                                    // Inputan Email
                                    CustomTextField(
                                        title: "Email",
                                        hint: "Masukkan Email",
                                        controller: emailController,
                                        validator: Validators.email,
                                    ),

                                    // Inputan No Hp
                                    CustomTextField(
                                        title: "No Handphone",
                                        hint: "Masukkan No Handphone",
                                        controller: noHandphoneController,
                                        validator: Validators.phone,
                                    ),

                                    // Inputan Alamat
                                    CustomTextField(
                                        title: "Alamat",
                                        hint: "Masukkan Alamat",
                                        controller: alamatController,
                                        validator: Validators.required,
                                    ),
                                ]
                            ),

                            formSection(
                                title: "Data Pendidikan",
                                children: [
                                    DataPendidikan(
                                        asalSekolahController: asalSekolahController,
                                        tahunLulusController: tahunLulusController,
                                        jurusanController: jurusanController
                                    )
                                ]
                            ),

                            formSection(
                                title: "Pilihan Program Studi",
                                children: [
                                    // Dropdown Prodi
                                    DropdownProdi(
                                        title: "Program Studi",
                                        value: prodi,
                                        onChanged: (value)
                                        {
                                            setState(()
                                                {
                                                    prodi = value;
                                                }
                                            );
                                        },
                                    ),
                                ]
                            ),

                            formSection(
                                title: "Upload Dokumen",
                                children: [
                                    UploadImageField(
                                        title: "KTP",
                                        onImageSelected: (file)
                                        {
                                            ktpImage = file;
                                        },
                                    ),
                                    UploadImageField(
                                        title: "Kartu Keluarga",
                                        onImageSelected: (file)
                                        {
                                            kkImage = file;
                                        },
                                    ),
                                    UploadImageField(
                                        title: "Ijazah",
                                        onImageSelected: (file)
                                        {
                                            ijazahImage = file;
                                        },
                                    ),
                                ],
                            ),

                            SizedBox(height: 20),

                            ButtonSubmit(
                                onPressed: () {
                                    // 🔹 validasi field (error bawah input)
                                    bool isFieldValid = formKey.currentState!.validate();

                                    // 🔹 validasi global (popup)
                                    bool isGlobalValid = validateGlobal();

                                    if (!isFieldValid || !isGlobalValid) return;

                                    // ✅ konfirmasi
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            title: Text("Konfirmasi"),
                                            content: Text("Apakah data sudah benar?"),
                                            actions: [
                                                TextButton(
                                                    onPressed: () => Navigator.pop(context),
                                                    child: Text("Batal"),
                                                ),
                                                ElevatedButton(
                                                    onPressed: () {
                                                        Navigator.pop(context);

                                                        // ✅ success popup
                                                        showModernDialog(
                                                            title: "Berhasil",
                                                            messages: ["Data berhasil disubmit"],
                                                            isSuccess: true,
                                                        );
                                                    },
                                                    child: Text("Ya"),
                                                ),
                                            ],
                                        ),
                                    );
                                },
                            )
                        ],
                    ),
                ),
            ),
        );
    }

}
