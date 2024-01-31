import 'package:college_buddy/features/profile/widgets/custom_cards.dart';
import 'package:flutter/material.dart';

class StudentDetails extends StatelessWidget {
  const StudentDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomCards(cardTxt: 'Students Name', icon: Icons.person_rounded),
        CustomCards(
          icon: Icons.assignment_turned_in_rounded,
          cardTxt: 'Students Roll.No',
        ),
        CustomCards(
          icon: Icons.assignment_ind,
          cardTxt: 'Students Regd.No',
        ),
        CustomCards(
          icon: Icons.school_rounded,
          cardTxt: 'Students Branch',
        ),
        CustomCards(
          icon: Icons.corporate_fare,
          cardTxt: 'Students Years & Sem ',
        ),
      ],
    );
  }
}
