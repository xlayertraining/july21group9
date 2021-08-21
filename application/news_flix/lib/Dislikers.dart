import 'package:flutter/material.dart';
import 'package:auto_animated/auto_animated.dart';

class Dislikers extends StatelessWidget {
  const Dislikers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Text(
            "Dislikes",
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.deepPurple),
            // set your color here
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          child: ListView(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.wallpapersden.com/image/download/demon-slayer-tanjirou-kamado_a2tsa2uUmZqaraWkpJRnamtlrWZlbWU.jpg'),
                ),
                title: Text(
                  'Samyadeep',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Samyadeep@gmail.com'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/originals/a1/7c/98/a17c987bf8596ae585d831f264b974c9.jpg'),
                ),
                title: Text(
                  'Basabjit',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Basab@gmail.com'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://s1.zerochan.net/Chrollo.Lucifer.600.1751540.jpg'),
                ),
                title: Text(
                  'Nabanit',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Nabanit@gmail.com'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://s1.zerochan.net/Chrollo.Lucifer.600.1751540.jpg'),
                ),
                title: Text(
                  'Aniket',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Anilet@gmail.com'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.wallpapersden.com/image/download/demon-slayer-tanjirou-kamado_a2tsa2uUmZqaraWkpJRnamtlrWZlbWU.jpg'),
                ),
                title: Text(
                  'Samyadeep',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Samyadeep@gmail.com'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/originals/a1/7c/98/a17c987bf8596ae585d831f264b974c9.jpg'),
                ),
                title: Text(
                  'Basabjit',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Basab@gmail.com'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://s1.zerochan.net/Chrollo.Lucifer.600.1751540.jpg'),
                ),
                title: Text(
                  'Nabanit',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Nabanit@gmail.com'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://s1.zerochan.net/Chrollo.Lucifer.600.1751540.jpg'),
                ),
                title: Text(
                  'Aniket',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Anilet@gmail.com'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.wallpapersden.com/image/download/demon-slayer-tanjirou-kamado_a2tsa2uUmZqaraWkpJRnamtlrWZlbWU.jpg'),
                ),
                title: Text(
                  'Samyadeep',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Samyadeep@gmail.com'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/originals/a1/7c/98/a17c987bf8596ae585d831f264b974c9.jpg'),
                ),
                title: Text(
                  'Basabjit',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Basab@gmail.com'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://s1.zerochan.net/Chrollo.Lucifer.600.1751540.jpg'),
                ),
                title: Text(
                  'Nabanit',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Nabanit@gmail.com'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://s1.zerochan.net/Chrollo.Lucifer.600.1751540.jpg'),
                ),
                title: Text(
                  'Aniket',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Anilet@gmail.com'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.wallpapersden.com/image/download/demon-slayer-tanjirou-kamado_a2tsa2uUmZqaraWkpJRnamtlrWZlbWU.jpg'),
                ),
                title: Text(
                  'Samyadeep',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Samyadeep@gmail.com'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/originals/a1/7c/98/a17c987bf8596ae585d831f264b974c9.jpg'),
                ),
                title: Text(
                  'Basabjit',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Basab@gmail.com'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://s1.zerochan.net/Chrollo.Lucifer.600.1751540.jpg'),
                ),
                title: Text(
                  'Nabanit',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Nabanit@gmail.com'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://s1.zerochan.net/Chrollo.Lucifer.600.1751540.jpg'),
                ),
                title: Text(
                  'Aniket',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Anilet@gmail.com'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.wallpapersden.com/image/download/demon-slayer-tanjirou-kamado_a2tsa2uUmZqaraWkpJRnamtlrWZlbWU.jpg'),
                ),
                title: Text(
                  'Samyadeep',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Samyadeep@gmail.com'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/originals/a1/7c/98/a17c987bf8596ae585d831f264b974c9.jpg'),
                ),
                title: Text(
                  'Basabjit',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Basab@gmail.com'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://s1.zerochan.net/Chrollo.Lucifer.600.1751540.jpg'),
                ),
                title: Text(
                  'Nabanit',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Nabanit@gmail.com'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://s1.zerochan.net/Chrollo.Lucifer.600.1751540.jpg'),
                ),
                title: Text(
                  'Aniket',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Anilet@gmail.com'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.wallpapersden.com/image/download/demon-slayer-tanjirou-kamado_a2tsa2uUmZqaraWkpJRnamtlrWZlbWU.jpg'),
                ),
                title: Text(
                  'Samyadeep',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Samyadeep@gmail.com'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/originals/a1/7c/98/a17c987bf8596ae585d831f264b974c9.jpg'),
                ),
                title: Text(
                  'Basabjit',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Basab@gmail.com'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://s1.zerochan.net/Chrollo.Lucifer.600.1751540.jpg'),
                ),
                title: Text(
                  'Nabanit',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Nabanit@gmail.com'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://s1.zerochan.net/Chrollo.Lucifer.600.1751540.jpg'),
                ),
                title: Text(
                  'Aniket',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Anilet@gmail.com'),
              ),
            ],
          ),
        ));
  }
}

// class SliverListScreen extends StatefulWidget {
//   @override
//   _SliverListScreenState createState() => _SliverListScreenState();
// }
//
// class _SliverListScreenState extends State<SliverListScreen> {
//   late ScrollController _scrollController;
//
//   @override
//   void initState() {
//     _scrollController = ScrollController();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         controller: _scrollController,
//         slivers: <Widget>[
//           SliverAppBar(
//               expandedHeight: 120,
//               flexibleSpace: FlexibleSpaceBar(
//                 title: Text('List Animation', style: TextStyle(fontWeight: FontWeight.bold)),
//               )),
//           FutureBuilder<List<String>>(
//             initialData: [],
//             builder: (context, snapshot) {
//               final List<String>? countries = snapshot.data;
//               return LiveSliverList(
//                 controller: _scrollController,
//                 itemCount: countries!.length,
//                 itemBuilder: (context, index, animation) {
//                   return FadeTransition(
//                     opacity: animation,
//                     child: SlideTransition(
//                       position: Tween<Offset>(
//                         begin: Offset(0, 0.3),
//                         end: Offset.zero,
//                       ).animate(animation),
//                       child: ListItem(
//                         title: countries[index],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ListItem {
//
