import 'package:flutter/material.dart';
import 'form_pmb_screen.dart';
import '../widgets/menu_card.dart';
import '../widgets/pengumuman.dart';

class HomeScreen extends StatelessWidget
{
    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text(
                    "Beranda",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                ),
                backgroundColor: Colors.blueAccent,
            ),

            body: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                        // Welcome Text
                        Text(
                            "Selamat Datang Di",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                        ),

                        SizedBox(height: 5),

                        Text(
                            "Penerimaan Mahasiswa Baru",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent
                            ),

                        ),

                        SizedBox(height: 20),

                        //   Menu Card
                        Text(
                            "Menu",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                        ),

                        SizedBox(height: 10),

                        Row(
                            children: [
                                Expanded(
                                    child: (
                                    menuCard(
                                        icon: Icons.edit,
                                        title: "Form Pendaftaran",
                                        subtitle: "isi formulis disini",
                                        onTap: ()
                                        {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => FormPMBScreen()
                                                ),
                                            );

                                        },
                                    )
                                    )),

                                SizedBox(width: 10),

                                Expanded(
                                    child:
                                    menuCard(
                                        icon: Icons.info,
                                        title: "Informasi PMB",
                                        subtitle: "lihat informasi",
                                        onTap: ()
                                        {
                                        }
                                    )),
                            ],
                        ),

                        SizedBox(height: 25),

                        //   Pengumuman
                        Text(
                            "Pengumuman",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                        ),

                        SizedBox(height: 10),

                        announcementCard(),
                        announcementCard(),
                        announcementCard(),
                        announcementCard(),
                        announcementCard(),
                        announcementCard(),
                        announcementCard(),
                    ]
                )
            ),
        );
    }
}
