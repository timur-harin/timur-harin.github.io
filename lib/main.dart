import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
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
      theme: ThemeData(
        fontFamily: 'JetBrainsMono',
        primarySwatch: Colors.orange,
      ),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 900, name: TABLET),
          const Breakpoint(start: 901, end: 1800, name: DESKTOP),
          const Breakpoint(start: 1801, end: double.infinity, name: '4K'),
        ],
      ),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (context) {
            return MaxWidthBox(
              maxWidth: 1800,
              background: Container(color: Colors.transparent),
              child: ResponsiveScaledBox(
                width: ResponsiveValue<double>(
                  context,
                  defaultValue: 1800.0,
                  conditionalValues: [
                    const Condition.equals(name: MOBILE, value: 1800.0),
                    const Condition.equals(name: TABLET, value: 1800.0),
                    const Condition.equals(name: DESKTOP, value: 1800.0),
                    const Condition.equals(name: '4K', value: 1800),
                  ],
                ).value,
                child: const SimpleWebPage(),
              ),
            );
          },
        );
      },
    );
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
      url: "https://timur-harin.ru/assets/Flutter_resume_Timur_Harin.pdf",
      text: "Резюме",
    ),
    TextLaunch(
      url:
          "https://github.com/timur-harin/Sum24FlutterCourse?tab=readme-ov-file#sum24fluttercourse",
      text: "Провел курс по Flutter в Innopolis University",
    ),
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
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const CircleAvatar(
                  radius: 150,
                  backgroundImage: AssetImage("assets/images/me.jpeg"),
                ),
                const AutoSizeText(
                  "Timur Harin",
                  minFontSize: 40,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const AutoSizeText(
                  "@timur_harin",
                  minFontSize: 40,
                  maxLines: 1,
                  style: TextStyle(
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
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            width: 70,
                            height: 70,
                            child: Image.asset(
                              iconLaunch.image,
                              color: Colors.black,
                              fit: BoxFit.cover,
                            ),
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
                            color: Colors.black.withOpacity(0.75),
                          ),
                          width: 1500,
                          margin: const EdgeInsets.all(10),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: AutoSizeText(
                                    textLaunch.text,
                                    minFontSize: 25,
                                    style: const TextStyle(color: Colors.white),
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
                ),
              ],
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
