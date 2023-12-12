import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'M A T E R I A L S',
          style: TextStyle(
            // fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      // body: Center(child:LottieBuilder.network(src) ),
    );
  }
}
