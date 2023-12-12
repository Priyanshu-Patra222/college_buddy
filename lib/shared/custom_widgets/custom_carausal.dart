
// import 'package:flutter/material.dart';
// import 'package:velocity_x/velocity_x.dart';

// class HomePageCarouselWidget extends StatefulWidget {
//   // final List<HomepageBodyItems> items;

//   const HomePageCarouselWidget({
//     super.key,
//     // required this.items,
//   });

//   @override
//   State<HomePageCarouselWidget> createState() => _HomePageCarouselWidgetState();
// }

// int pageNo = 0;

// class _HomePageCarouselWidgetState extends State<HomePageCarouselWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         AspectRatio(
//           aspectRatio: 16 / 9,

//           // color: Colors.blue,
//           child: Swiper(
//             viewportFraction: 0.88,
//             scale: 0.90,
//             autoplay: true,
//             fade: 0.4,
//             onIndexChanged: (index) {
//               setState(() {
//                 pageNo = index;
//               });
//             },
//             itemCount: widget.items.length,
//             itemBuilder: (context, index) {
//               return Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12.0),
//                   color: Colors.amberAccent,
//                 ),
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(12.0),
//                       child: CacheNetworkImageWidget(
//                         imageUrl: widget.items[index].image!.url ??
//                             "https://source.unsplash.com/random/800x800/?img=$index",
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.bottomCenter,
//                       child: Container(
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           // color: Colors.black.withOpacity(0.4),
//                           gradient: LinearGradient(
//                             begin: Alignment.topCenter,
//                             end: Alignment.bottomCenter,
//                             colors: [
//                               Colors.black.withOpacity(0.0),
//                               Colors.black.withOpacity(0.9),
//                             ],
//                           ),
//                           borderRadius: const BorderRadius.only(
//                             bottomRight: Radius.circular(12),
//                             bottomLeft: Radius.circular(12),
//                           ),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.only(bottom: 8.0),
//                           child: AppSmallText(
//                             text: widget.items[index].carouselTitle!
//                                 .toUpperCase(),
//                             fontSize: 20,
//                             letterSpacing: 4,
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               );
//             },
//           ),
//         ).pOnly(bottom: 15),
//         AnimatedSmoothIndicator(
//           activeIndex: pageNo,
//           count: widget.items.length,
//           effect: const ExpandingDotsEffect(
//             dotHeight: 6,
//             dotWidth: 6,
//             dotColor: Colors.white,
//             activeDotColor: Colors.orange,
//           ),
//         ),
//       ],
//     );
//   }
// }
