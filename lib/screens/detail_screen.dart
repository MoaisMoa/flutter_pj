import 'package:flutter/material.dart';
import '../models/cat.dart';
final List<String> replies = [
  "세상에... 솜방망이 좀 보세요 ㅠㅠ 사진 보자마자 심장 멎는 줄 알았어요. 완전 천사 그 자체네요! ❤️",
  "오늘 회사에서 스트레스 잔뜩 받았는데 이 영상 보고 완치됐습니다. 역시 고양이가 나라를 구하네요. 제 마음도 다 가져갔어요... 🐱✨",
  "혹시 고양이 MBTI가 'CUTE'인가요? 어떻게 숨만 쉬어도 이렇게 귀여울 수 있죠? 당장 저희 집으로 납치(?)하고 싶네요!",
  "저희 집 애기랑 무늬가 비슷해서 더 정이 가네요! 혹시 사용하시는 캣타워 정보 알 수 있을까요? 너무 잘 어울려요. :)",
  "미묘 그 자체네요... 눈동자가 보석 같아요! 예쁜 사진 공유해주셔서 감사합니다. 힐링하고 가요! 🍀",
  "역시 고양이가 세상을 지배해야 합니다. 이 귀여움이면 전 세계 평화도 가능할 것 같아요. 오늘 하루 중 제일 행복한 순간이네요. 🌈",
];

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.cat,
    });
  final Cat cat;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cat.title),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 10.0,
                right: 10.0,
              ),
              physics: const ClampingScrollPhysics(),
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    widget.cat.link,
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.cat.name,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Color(
                          0xFF777777,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            isLiked ? Icons.thumb_up : Icons.thumb_up_outlined
                          ),
                          onPressed: () {},
                        ),
                        Text(
                          widget.cat.likeCount.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  "댓글 ${widget.cat.replyCount}개",
                ),
                ...List.generate(
                  replies.length,
                  (int index) => Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "익명",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.0),
                        ),
                        Text(
                          replies[index],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: Text(
                    "${widget.cat.created.year}년 ${widget.cat.created.month}월 ${widget.cat.created.day}일",
                    style: const TextStyle(
                      color: Color(0xFFAAAAAA),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  color: Theme.of(context).canvasColor,
                  child: const TextField(
                    autocorrect: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top: 5.0,
                        bottom: 5.0,
                        left: 10.0,
                      ),
                      border: OutlineInputBorder(),
                      hintText: "댓글 작성",
                      suffixIcon: Icon(
                        Icons.send,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}