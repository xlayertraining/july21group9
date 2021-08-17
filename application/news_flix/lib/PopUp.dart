// import 'package:first_app/CustomPopupMenu.dart';
// import 'package:flutter/material.dart';
// void main() =>
//     runApp(MaterialApp(title: "Popup Menu Button", home: MainActivity()));
// class MainActivity extends StatefulWidget {
//   @override
//   _MainActivityState createState() => _MainActivityState();
// }
// List choices = [
//   CustomPopupMenu(title: 'Home', icon: Icons.home),
//   CustomPopupMenu(title: 'Bookmarks', icon: Icons.bookmark),
//   CustomPopupMenu(title: 'Settings', icon: Icons.settings),
// ];
// class _MainActivityState extends State {
//   CustomPopupMenu _selectedChoices = choices[0];
//   void _select(CustomPopupMenu choice) {
//     setState(() {
//       _selectedChoices = choice;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.yellow,
//       appBar: AppBar(
//         title: Text('Popup Menu Button'),
//         actions: [
//           PopupMenuButton(
//             elevation: 3.2,
//             initialValue: choices[1],
//             onCanceled: () {
//               print('You have not chossed anything');
//             },
//             tooltip: 'This is tooltip',
//             onSelected: _select,
//             itemBuilder: (BuildContext context) {
//               return choices.map((CustomPopupMenu choice) {
//                 return PopupMenuItem(
//                   value: choice,
//                   child: Text(choice.title),
//                 );
//               }).toList();
//             },
//           )
//         ],
//       ),
//       body: bodyWidget(),
//     );
//   }
//   bodyWidget() {
//     return Container(
//       child: SelectedOption(choice: _selectedChoices),
//     );
//   }
// }
// class SelectedOption extends StatelessWidget {
//   CustomPopupMenu choice;
//   SelectedOption({Key key, this.choice}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(choice.icon, size: 140.0, color: Colors.white),
//             Text(
//               choice.title,
//               style: TextStyle(color: Colors.white, fontSize: 30),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }