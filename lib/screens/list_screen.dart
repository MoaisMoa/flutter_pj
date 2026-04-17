import 'package:flutter/material.dart';
import '../models/cat.dart';
import '../screens/detail_screen.dart';
import '../screens/upload_screen.dart';

final List<Cat> cats = [
  Cat(
    id: "0",
    name: "별님이",
    title: "오늘의 귀염둥이",
    link: "assets/images/cat_00.jpg",
    likeCount: 1930,
    replyCount: 6,
    created: DateTime(2022, 11, 13, 22, 14, 53, 982),
  ),

  Cat(
    id: "1",
    name: "쿠키",
    title: "야옹",
    link: "assets/images/cat_01.jpg",
    likeCount: 301,
    replyCount: 2,
    created: DateTime(2022, 10, 24, 11, 00, 23, 423),
  ),

  Cat(
    id: "2",
    name: "레오",
    title: "야옹야옹",
    link: "assets/images/cat_02.jpg",
    likeCount: 301,
    replyCount: 2,
    created: DateTime(2022, 8, 14, 1, 00, 23, 553),
  ),

  Cat(
    id: "3",
    name: "피오",
    title: "야야옹옹",
    link: "assets/images/cat_03.jpg",
    likeCount: 202,
    replyCount: 71,
    created: DateTime(2022, 10, 24, 11, 00, 23, 423),
  )
];

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
          title: const Text("Daily cats"),
          actions: [
            // 업로드화면으로 이동
            IconButton(
              icon: const Icon(Icons.camera_alt),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => const UploadScreen(),
                  );
              },
            ),
          ],
        ),
        body: GridView.builder(
          padding: const EdgeInsets.only(
          top: 10.0,
          left: 10.0,
          right: 10.0,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1.0,
        ),
        itemCount: cats.length,
        itemBuilder: (_, int index) => GestureDetector(
          // 상세 화면으로 이동

          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  cat: cats[index],
                ),
              ),
            );
          },
          child: Image.asset(
            cats[index].link,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}