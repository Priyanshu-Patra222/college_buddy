import 'package:college_buddy/const/resource.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hey, Buddy!",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Keep Smiling, Keep Shining 😅",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        CircleAvatar(
          radius: 28,
          backgroundImage: Image.asset(R.ASSETS_IMG_20230928_183603_JPG).image,
        )
      ],
    );
  }
}
