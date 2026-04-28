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
        onPressed: onPressed,
        child: Text("Daftar"),
      ),
    );
  }
}
