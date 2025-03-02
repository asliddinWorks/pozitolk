// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: StackListViewExample(),
//     );
//   }
// }
//
// class StackListViewExample extends StatefulWidget {
//   const StackListViewExample({super.key});
//
//   @override
//   _StackListViewExampleState createState() => _StackListViewExampleState();
// }
//
// class _StackListViewExampleState extends State<StackListViewExample> {
//   final ScrollController _firstScrollController = ScrollController();
//   final ScrollController _secondScrollController = ScrollController();
//   bool isSecondListActive = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // 1-ListView oxiriga yetsa, 2-ListView chiqadi
//     _firstScrollController.addListener(() {
//       if (_firstScrollController.position.pixels >=
//           _firstScrollController.position.maxScrollExtent - 5) {
//         setState(() {
//           isSecondListActive = true;
//         });
//       }
//     });
//
//     // 2-ListView boshiga qaytsa, yana 1-ListView aktiv bo‘ladi
//     _secondScrollController.addListener(() {
//       if (_secondScrollController.position.pixels <= 0) {
//         setState(() {
//           isSecondListActive = false;
//         });
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // 1-ListView (Tugmalar bor)
//           SingleChildScrollView(
//             controller: _firstScrollController,
//             child: Column(
//               children: [
//                 ...List.generate(
//                   10,
//                       (index) => ElevatedButton(
//                     onPressed: () {
//                       if (!isSecondListActive) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('Button $index bosildi')),
//                         );
//                       }
//                     },
//                     child: Text("Button $index"),
//                   ),
//                 ),
//                 const SizedBox(height: 400), // Skroll bo‘lishi uchun bo‘sh joy
//               ],
//             ),
//           ),
//
//           // 2-ListView (Pastdan chiqadigan)
//           AnimatedPositioned(
//             duration: const Duration(milliseconds: 300),
//             curve: Curves.easeInOut,
//             bottom: isSecondListActive ? 0 : -300, // Pastdan chiqadi
//             left: 0,
//             right: 0,
//             height: 300,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(color: Colors.black26, blurRadius: 5),
//                 ],
//               ),
//               child: ListView.builder(
//                 controller: _secondScrollController,
//                 itemCount: 20,
//                 itemBuilder: (context, index) => ListTile(
//                   title: Text('Item $index'),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
