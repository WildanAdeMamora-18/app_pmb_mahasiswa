import 'package:flutter/material.dart';

class ButtonSubmit extends StatelessWidget
{
  final VoidCallback onPressed;

  ButtonSubmit({required this.onPressed});

  @override
  Widget build(BuildContext context)
  {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
          foregroundColor: MaterialStateProperty.all(Colors.white), // warna teks
        ),
        onPressed: onPressed,
        child: Text("Daftar"),
      ),
    );
  }
}
