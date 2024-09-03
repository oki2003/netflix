import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView(
      {super.key, required this.listData, required this.panelController});
  final List listData;
  final PanelController panelController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        backgroundColor: const Color.fromRGBO(51, 51, 51, 1.0),
        title: Row(
          children: [
            const Expanded(flex: 4, child: Text("Comment")),
            IconButton(
                onPressed: () {
                  // panelController.close();
                  panelController.hide();
                },
                icon: const Icon(Icons.close))
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 1,
              child: ColoredBox(color: Colors.white),
            ),
            ...listData.map((review) => Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 8, right: 8, bottom: 8),
                          child: CircleAvatar(
                              radius: 15.0,
                              backgroundImage: NetworkImage(
                                  "${review.author.avatarPath}"
                                  // (review.author.avatarPath != null)
                                  //     ? "https://image.tmdb.org/t/p/w500/${review.author.avatarPath}"
                                  //     : "https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?size=626&ext=jpg",
                                  )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("@${review.author.username}",
                                    style: const TextStyle(
                                        height: 3,
                                        color:
                                            Color.fromRGBO(133, 133, 133, 1))),
                                Text(
                                  review.content,
                                  softWrap: true,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
