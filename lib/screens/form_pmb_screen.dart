import 'package:flutter/material.dart';
import '../widgets/input_text.dart';
import '../widgets/dropdown_prodi.dart';
import '../widgets/button_submit.dart';
import '../widgets/tempat_tanggal_lahir.dart';
import '../widgets/radio_gender.dart';
import '../widgets/form_section.dart';

class FormPMBScreen extends StatefulWidget
{
    @override
    _FormPMBScreenState createState() => _FormPMBScreenState();
}

class _FormPMBScreenState extends State<FormPMBScreen>
{
    final formKey = GlobalKey<FormState>();

    String? prodi;
    String? gender;

    TextEditingController namaController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController nikController = TextEditingController();
    TextEditingController tempatLahirController = TextEditingController();
    TextEditingController tanggalLahirController = TextEditingController();
    TextEditingController alamatController = TextEditingController();
    TextEditingController noHandphoneController = TextEditingController();

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
                                        // validator: validators.required,
                                    ),

                                    // Inputan NIK
                                    CustomTextField(
                                        title: "NIK",
                                        hint: "Masukkan NIK",
                                        controller: nikController,
                                        // validator: validators.required,
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
                                        // validator: validators.required,
                                    ),

                                    // Inputan No Hp
                                    CustomTextField(
                                        title: "No Handphone",
                                        hint: "Masukkan No Handphone",
                                        controller: noHandphoneController,
                                    ),

                                    // Inputan Alamat
                                    CustomTextField(
                                        title: "Alamat",
                                        hint: "Masukkan Alamat",
                                        controller: emailController,
                                        // validator: validators.required,
                                    ),
                                ]
                            ),

                            formSection(
                                title: "Data Pendidikan",
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

                            SizedBox(height: 20),

                            ButtonSubmit(
                                onPressed: ()
                                {
                                    if (formKey.currentState!.validate())
                                    {
                                        ScaffoldMessenger
                                            .of(context)
                                            .showSnackBar(
                                                SnackBar(content: Text(
                                                        "Berhasil submit")),
                                            );
                                    }
                                },
                            )
                        ],
                    ),
                ),
            ),
        );
    }

}
