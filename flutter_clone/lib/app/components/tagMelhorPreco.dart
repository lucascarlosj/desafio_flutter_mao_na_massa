import 'package:flutter/material.dart';

class TagMelhorPreco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.label,
            color: Colors.white,
          ),
          Text(
            'Melhor Preço ',
            style: TextStyle(color: Colors.white, fontSize: 10),
          )
        ],
      ),
    );
  }
}
