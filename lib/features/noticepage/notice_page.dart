import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class NoticePage extends StatelessWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NoticeView();
  }
}

class NoticeView extends StatefulWidget {
  const NoticeView({super.key});

  @override
  State<NoticeView> createState() => _NoticeViewState();
}

class _NoticeViewState extends State<NoticeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("L A T E S T   N O T I C E",
            style: TextStyle(
                color: Colors.black,
                // fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black54,
                size: 30,
              )).pOnly(right: 12),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: ListView.builder(
            itemCount: 2,
            primary: false,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: ExpansionTile(
                  title: Text("Latest Notice",
                      style: TextStyle(
                          color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)),
                  children: [
                    Text("No notice found",
                        style: TextStyle(
                            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300)),
                  ],
                ),
              );
            },
          ).p(10),
        ),
      ),
    );
  }
}
