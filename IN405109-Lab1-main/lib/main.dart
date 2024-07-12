import 'package:flutter/material.dart';
import 'package:lab1/DetailPage.dart';
import 'package:lab1/student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyAppPage(),
    );
  }
}

class MyAppPage extends StatelessWidget {
  const MyAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Student> datas = [
      Student("ธนบดี สวัสดี", "643450325-4", "image/TeammyNo1.jpg",
          "thanabodee.s@kkkumail.com", "Work ไร้ Balance", "IG: teammy_cube"),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("TeammyNo1"),
      ),
      body: ListView.builder(
          itemCount: datas.length,
          itemBuilder: (context, index) {
            return displayItem(context: context, student: datas[index]);
          }),
    );
  }

  Widget displayItem(
      {required BuildContext context, required Student student}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      data: student,
                    )));
      },
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(children: [
            Image(
              width: 100,
              image: AssetImage(student.image),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.name,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  student.studentid,
                  style: const TextStyle(fontSize: 12),
                )
              ],
            )
          ])),
    );
  }
}
