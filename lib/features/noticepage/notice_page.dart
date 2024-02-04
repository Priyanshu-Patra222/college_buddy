import 'package:auto_route/auto_route.dart';
import 'package:college_buddy/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<void> _refresh() async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 2));

    // Update the page if any update is there
    setState(() {});

    // Show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        // margin: const EdgeInsets.only(bottom: 80, left: 20, right: 20),
        backgroundColor: Colors.black,
        content: Text(
          'All are updated ✨',
          style: GoogleFonts.poppins(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.w400),
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("L A T E S T   N O T I C E",
            style: TextStyle(
                // color: Colors.black,
                // fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: SingleChildScrollView(
            child: ListView.builder(
              itemCount: 12,
              primary: false,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: ExpansionTile(
                    title: const Text("Latest Notice ..",
                        style: TextStyle(
                            // color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                    children: [
                      //* Implement the Image/Pdf fetching logic from the backend *//

                      Stack(
                        children: [
                          Image.asset(R.ASSETS_IMG_20230928_183603_JPG),
                          Positioned(
                              bottom: 10,
                              left: 10,
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Download ",
                                        style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const Icon(
                                        Icons.download_for_offline_sharp,
                                        size: 25,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ).pOnly(top: 5, bottom: 5, left: 7, right: 7),
                                ),
                              ))
                        ],
                      ),
                      // Text("No notice found",
                      //     style: TextStyle(
                      //         color: Colors.black,
                      //         fontSize: 15,
                      //         fontWeight: FontWeight.w300)),
                    ],
                  ),
                );
              },
            ).p(10),
          ),
        ),
      ),
    );
  }
}
