import 'package:flutter/material.dart';
import 'package:netflix/utils/colors.dart';

class Textfeildlogin extends StatelessWidget {
  Textfeildlogin({required this.labeltxt, required this.controller, super.key});

  final String? labeltxt;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 50,
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: labeltxt,
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                  filled: true,
                  fillColor: Palette.textfeildbgdarkgrey,
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Palette.textfeildbgdarkgrey)) 
                ),
                controller: controller,
              ),
            );
  }
}