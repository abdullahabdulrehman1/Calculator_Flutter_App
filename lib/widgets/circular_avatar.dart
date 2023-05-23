import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CircularButtonWithSign extends StatelessWidget {
final Icon icon;
final  Color?  color ;
  const CircularButtonWithSign({super.key, required this.icon,this.color});
  @override
  Widget build(BuildContext context) {
    return Column(

        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: icon
          ),
        ],



    );
  }
}