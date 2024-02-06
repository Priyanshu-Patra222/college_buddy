import 'package:auto_route/annotations.dart';
import 'package:college_buddy/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class StudyMaterialsPage extends StatelessWidget {
  const StudyMaterialsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StudyMaterialsView();
  }
}

class StudyMaterialsView extends StatefulWidget {
  const StudyMaterialsView({super.key});

  @override
  State<StudyMaterialsView> createState() => _StudyMaterialsViewState();
}

class _StudyMaterialsViewState extends State<StudyMaterialsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'MATERIALS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 3,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            R.ASSETS_ILLUSTRATIONS_NO_DATA_ILLUSTRATION_SVG,
            fit: BoxFit.scaleDown,
            height: 200,
          ),
          15.heightBox,
          const Text(
            'No data found!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ).objectBottomCenter(),
        ],
      ),
    );
  }
}
