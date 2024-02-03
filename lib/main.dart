import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Timur Harin',
        home: const SimpleWebPage(),
        theme: ThemeData(
          fontFamily: 'JetBrainsMono',
          primarySwatch: Colors.green,
        ));
  }
}

class SimpleWebPage extends StatefulWidget {
  const SimpleWebPage({super.key});

  @override
  State<SimpleWebPage> createState() => _SimpleWebPageState();
}

class _SimpleWebPageState extends State<SimpleWebPage> {
  List<IconLaunch> topElements = [
    IconLaunch(
        url: "https://t.me/timur_harin", image: "assets/icons/telegram.png"),
    IconLaunch(
        url: "https://github.com/timur-harin",
        image: "assets/icons/github.png"),
    IconLaunch(
        url: "https://leetcode.com/timur_harin/",
        image: "assets/icons/leetcode.png"),
  ];

  List<TextLaunch> listElements = [
    TextLaunch(
        url: "https://t.me/code_v_meshke",
        text: "Телеграмм канал о кроссплатформенной разработке "),
    TextLaunch(
        url: "https://t.me/timur_harin_bot",
        text: "Бот с советами что посмотреть, что купить, что почитать "),
    TextLaunch(
        url:
            "https://scholar.google.com/scholar?hl=en&as_sdt=0%2C5&q=Timur+Kharin&btnG=",
        text: "Здесь будут научные публикации и другие научные дела "),
    TextLaunch(
        url:
            "https://www.youtube.com/playlist?list=PLz1kbB-Ej5hWeJ4ba_qO_kIdSjj473js4",
        text: "Здесь будут мои выступления на различных конференциях "),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/evening.jpeg"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height / 20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width / 20,
                    backgroundImage: const AssetImage("assets/images/me.jpeg"),
                  ),
                  Text(
                    "Timur Harin",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 30,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "@timur_harin",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 50,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (IconLaunch iconLaunch in topElements)
                        InkWell(
                          onTap: () async {
                            await launchUrl(Uri.parse(iconLaunch.url));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width / 30,
                            height: MediaQuery.of(context).size.width / 30,
                            child: Image.asset(
                              iconLaunch.image,
                              color: Colors.black,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Column(
                    children: [
                      for (TextLaunch textLaunch in listElements)
                        InkWell(
                          onTap: () async {
                            await launchUrl(Uri.parse(textLaunch.url));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.black.withOpacity(0.5),
                            ),
                            width: MediaQuery.of(context).size.width / 2,
                            margin: const EdgeInsets.all(10),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: AutoSizeText(
                                      textLaunch.text,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_outward,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IconLaunch {
  IconLaunch({required this.url, required this.image});

  final String url;
  final String image;
}

class TextLaunch {
  TextLaunch({required this.url, required this.text});

  final String url;
  final String text;
}
