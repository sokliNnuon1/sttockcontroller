
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:stock_control_app/widget/Dialog_confirm_report.dart';
// import 'package:stock_control_app/widget/text.dart';

// class ReportCard extends StatefulWidget {
//   const ReportCard({Key? key}) : super(key: key);

//   @override
//   State<ReportCard> createState() => _ReportCardState();
// }

// class _ReportCardState extends State<ReportCard> {
//   bool _isExpanded = true;
//   // Initial Selected Value
//   String dropdownvalue = 'Item 1';

//   // List of items in our dropdown menu
//   var items = [
//     'Item 1',
//     'Item 2',
//     'Item 3',
//     'Item 4',
//     'Item 5',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8.0),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.3),
//                   blurRadius: 8.0,
//                   offset: const Offset(0, 4),
//                 ),
//               ],
//             ),
//             child: ExpansionTileCard(
//               trailing: const SizedBox.shrink(),
//               onExpansionChanged: (bool expanded) {
//                 setState(() {
//                   _isExpanded = !expanded;
//                 });
//               },
//               title: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       LimitedBox(
//                         maxWidth: 190,
//                         child: textComponent(text: 'Receiver Phone :', size: 12),
//                       ),
//                       LimitedBox(
//                         maxWidth: 140,
//                         child: textComponent(text: '123-456-7890', size: 12),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       LimitedBox(
//                         maxWidth: 190,
//                         child: textComponent(text: 'Zone :', size: 12),
//                       ),
//                       LimitedBox(
//                         maxWidth: 140,
//                         child: textComponent(text: 'North Zone', size: 12),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       LimitedBox(
//                         maxWidth: 190,
//                         child: textComponent(text: 'COD :', size: 12),
//                       ),
//                       LimitedBox(
//                         maxWidth: 140,
//                         child: textComponent(text: '\$50.00', size: 12),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       LimitedBox(
//                         maxWidth: 190,
//                         child: textComponent(text: 'Receiver Address:', size: 12),
//                       ),
//                       LimitedBox(
//                         maxWidth: 140,
//                         child: textComponent(text: '123 Main St', size: 12),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       LimitedBox(
//                         maxWidth: 190,
//                         child: textComponent(text: 'Receiver Name:', size: 12),
//                       ),
//                       LimitedBox(
//                         maxWidth: 140,
//                         child: textComponent(text: 'John Doe', size: 12),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       LimitedBox(
//                         maxWidth: 190,
//                         child: textComponent(text: 'Driver Phone:', size: 12),
//                       ),
//                       LimitedBox(
//                         maxWidth: 140,
//                         child: textComponent(text: '987-654-3210', size: 12),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               subtitle: Center(
//                 child: _isExpanded
//                     ? SvgPicture.asset(
//                   'assets/images/arrow-circle-down1.svg',
//                   width: 24.0,
//                   height: 24.0,
//                 )
//                     : SvgPicture.asset(
//                   'assets/images/arrow-circle-down-back.svg',
//                   width: 24.0,
//                   height: 24.0,
//                 ),
//               ),
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(left: 15.0, right: 56),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           LimitedBox(
//                             maxWidth: 190,
//                             child: textComponent(text: 'Arrival Date :', size: 12),
//                           ),
//                           LimitedBox(
//                             maxWidth: 140,
//                             child: textComponent(text: '2024-10-01', size: 12),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           LimitedBox(
//                             maxWidth: 190,
//                             child: textComponent(text: 'Finish Date :', size: 12),
//                           ),
//                           LimitedBox(
//                             maxWidth: 140,
//                             child: textComponent(text: '2024-10-30', size: 12),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           LimitedBox(
//                             maxWidth: 190,
//                             child: textComponent(text: 'Fee:', size: 12),
//                           ),
//                           LimitedBox(
//                             maxWidth: 140,
//                             child: textComponent(text: '\$10.00', size: 12),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           LimitedBox(
//                             maxWidth: 190,
//                             child: textComponent(text: 'Taxi Fee:', size: 12),
//                           ),
//                           LimitedBox(
//                             maxWidth: 140,
//                             child: textComponent(text: '\$5.00', size: 12),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           LimitedBox(
//                             maxWidth: 190,
//                             child: textComponent(text: 'Remarks:', size: 12),
//                           ),
//                           LimitedBox(
//                             maxWidth: 140,
//                             child: textComponent(text: 'N/A', size: 12),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         flex: 5,
//                         child: textComponent(text: 'Total :', bold: FontWeight.bold),
//                       ),
//                       Expanded(
//                         flex: 3,
//                         child: Container(
//                           alignment: Alignment.centerRight,
//                           child: textComponent(
//                             text: '\$65.00',
//                             color: const Color(0xff02B28E),
//                             bold: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Positioned(
//           top: 5,
//           right: 10,
//           // child: Image.asset('assets/images/imgcheck.png', height: 30, width: 40),

//           child: IconButton(
//             icon: Icon(Icons.more_vert_outlined), // Replace with your desired icon
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return CustomDialog(dialogText: 'Hell0',); // Ensure CustomDialog is a widget that returns a Dialog
//                 },
//               );
//             },
//           ),

//         ),
//         Positioned(
//           bottom: 11,
//           right: 10,
//           child: Container(
//             height: 19,
//             width: 70,
//             decoration: BoxDecoration(
//               color: const Color(0xff4CAF50),
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 bottomRight: Radius.circular(10),
//               ),
//             ),
//             child: const Center(
//               child: Text(
//                 'Paid',
//                 style: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w400,
//                   color: Color(0xffF2F2F2),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
