import "package:flutter/material.dart";

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFF92C7CF), borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(color: Color(0xFFF9EFDB), fontSize: 20),
            ),
            const SizedBox(width: 10),
            Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFFF9EFDB),
            )
          ],
        ),
      ),
    );
  }
}
