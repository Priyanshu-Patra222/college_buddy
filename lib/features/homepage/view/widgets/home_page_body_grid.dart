import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePagePrimaryIcons extends StatelessWidget {
  const HomePagePrimaryIcons({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.2),
          border: Border.all(
            // color: const Color(0xff6C63FF),
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  overflow: TextOverflow.clip,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ).pOnly(top: 10),
            ),
            Expanded(
              flex: 1,
              child: Image.asset(icon),
            ),
            Expanded(
              flex: 1,
              child: const Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  Icons.arrow_forward,
                  size: 25,
                ),
              ).pOnly(bottom: 10, right: 10),
            ),
          ],
        ),
      ),
    );
  }
}
