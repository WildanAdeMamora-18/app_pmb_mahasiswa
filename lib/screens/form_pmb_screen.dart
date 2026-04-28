import 'package:flutter/material.dart';
import '../widgets/input_text.dart';
import '../widgets/dropdown_prodi.dart';
import '../widgets/button_submit.dart';
import '../widgets/tempat_tanggal_lahir.dart';

class FormPMBScreen extends StatefulWidget
{
    @override
    _FormPMBScreenState createState() => _FormPMBScreenState();
}

class _FormPMBScreenState extends State<FormPMBScreen>
{
    final formKey = GlobalKey<FormState>();

    String? prodi;

    TextEditingController namaController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController nikController = TextEditingController();
    TextEditingController tempatLahirController = TextEditingController();
    TextEditingController tanggalLahirController = TextEditingController();

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
                                tempatLahirController: tempatLahirController,
                                tanggalLahirController: tanggalLahirController,
                                onDateSelected: (date)
                                {
                                    print("Tanggal Lahir: $date");
                                },
                            ),

                            // Inputan Email
                            CustomTextField(
                                title: "Email",
                                hint: "Masukkan Email",
                                controller: emailController,
                                // validator: validators.required,
                            ),

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
