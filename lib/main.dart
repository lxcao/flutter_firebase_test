/*
 * @Author: clingxin
 * @Date: 2021-05-24 10:03:52
 * @LastEditors: clingxin
 * @LastEditTime: 2021-05-24 11:01:31
 * @FilePath: /flutter_firebase_test/lib/main.dart
 */
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firebase'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => FirebaseFirestore.instance
              .collection('testing')
              .add({'timestamp': Timestamp.fromDate(DateTime.now())}),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('testing').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return SizedBox.shrink();
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                final docData = snapshot.data.docs[index].data();
                final dateTime = (docData['timestamp'] as Timestamp).toDate();
                return ListTile(
                  title: Text(dateTime.toString()),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
