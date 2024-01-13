import 'package:flutter/cupertino.dart';

class IconwithText extends StatelessWidget {
  const IconwithText({required this.icon, required this.title, super.key});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
      child: Column(
        children: [Icon(icon), Text(title)],
      ),
    );
  }
}
