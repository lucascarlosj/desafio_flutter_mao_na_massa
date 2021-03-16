import 'package:flutter/material.dart';

class ButtonAgendamento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80.0),
      ),
      padding: const EdgeInsets.all(0),
      child: Ink(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2196f3),
              Color(0xFF0D47A1),
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(80.0),
          ),
        ),
        child: Container(
          height: 70,
          width: 230,
          alignment: Alignment.center,
          child: const Text(
            'IR PARA O AGENDAMENTO',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
