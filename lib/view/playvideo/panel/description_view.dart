import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DescriptionView extends StatelessWidget {
  const DescriptionView(
      {super.key,
      required this.listData,
      required this.panelController,
      required this.typeMovidePlaying,
      required this.title,
      required this.nameMovidePlaying});
  final listData;
  final PanelController panelController;
  final String typeMovidePlaying;
  final String title;
  final String nameMovidePlaying;
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
            const Expanded(flex: 4, child: Text("Description")),
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
        child: Container(
          //  alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                typeMovidePlaying != "Featurette"
                    ? "$title | $nameMovidePlaying | $typeMovidePlaying"
                    : nameMovidePlaying,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Text("${listData["vote_count"]}"),
                      const Text(
                        "Vote count",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(148, 148, 148, 1)),
                      )
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Text("${listData["status"]}"),
                      const Text(
                        "Status",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(148, 148, 148, 1)),
                      )
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Text("${listData["release_date"]}"),
                      const Text(
                        "Release date",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(148, 148, 148, 1)),
                      )
                    ],
                  ))
                ],
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color.fromRGBO(51, 51, 51, 1.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${listData["overview"]}"),
                    RichText(
                        text: TextSpan(
                      children: [
                        ...listData["genres"].map(
                            (genre) => TextSpan(text: "#${genre["name"]} ")),
                      ],
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 120, 219)),
                    ))
                  ],
                ),
              ),
              const Text("Companies:"),
              const SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...listData["production_companies"]
                        .map((item) => (item["logo_path"] != null)
                            ? Image.network(
                                "https://image.tmdb.org/t/p/w500${item["logo_path"]}",
                                height: 80,
                              )
                            : const SizedBox())
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
