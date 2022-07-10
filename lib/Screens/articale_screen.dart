import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smartEdu/NavigationBar_Screens/start_screen.dart';
import 'package:smartEdu/shared/commponents.dart';
import 'package:chewie/chewie.dart';
import 'package:smartEdu/shared/constants/size_config.dart';
import 'package:video_player/video_player.dart';

class ArticalScreen extends StatefulWidget {
  @override
  _ArticalScreenState createState() => _ArticalScreenState();
}

class _ArticalScreenState extends State<ArticalScreen> {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  @override
  void initState() {
    videoPlayerController =
        VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4")
          ..addListener(() => setState(() {}))
          // ..setLooping(false)
          ..initialize().then((_) {
            // videoPlayerController!.pause();
            if (videoPlayerController != null) {
              chewieController = ChewieController(
                  videoPlayerController: videoPlayerController!,
                  autoPlay: false,
                  looping: false,
                  errorBuilder: (ctx, error) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: SizeConfig.getProportionateScreenWidth(15)),
                      alignment: Alignment.center,
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.getProportionateScreenHeight(239),
                      decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            style: BorderStyle.solid,
                            width: 1,
                            color: Colors.grey,
                          )),
                      child: Text('Text'),
                    );
                  }
                  // subtitle: Subtitles([
                  //   Subtitle(
                  //     index: 0,
                  //     start: Duration.zero,
                  //     end: const Duration(seconds: 10),
                  //     text: 'Hello from subtitles',
                  //   ),
                  //   Subtitle(
                  //     index: 1,
                  //     start: const Duration(seconds: 10),
                  //     end: const Duration(seconds: 20),
                  //     text: 'Whats up? 🙂',
                  //   ),
                  // ]),
                  // subtitleBuilder: (context, subtitle) => Container(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: Text(
                  //     subtitle,
                  //     style: const TextStyle(color: Colors.white),
                  //   ),
                  // ),
                  ); //..addListener(() => setState(() {}));
            }
          });

    super.initState();
  }

  Map<String, bool?> lightSwitches = {
    'Ans 1': false,
    'Ans 2': false,
    'Ans 3': false,
    'Ans 4': false,
  };
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("0053CB"),
        leading: IconButton(
          onPressed: () {
            navigateTo(context, StartScreen());
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          iconSize: SizeConfig.getProportionateScreenWidth(24),
        ),
        toolbarHeight: 70,
        title: Text(
          'Artificial Intelligence',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color: HexColor('FFFFFF'),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            videoPlayerController != null && videoPlayerController!.value.isInitialized && chewieController != null
                ? Container(
                    height: SizeConfig.screenWidth / 16 * 9,
                    width: SizeConfig.screenHeight / 16 * 9,
                    child: Chewie(
                      controller: chewieController!,
                    ),
                  )
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: SizeConfig.getProportionateScreenWidth(15))
                        .copyWith(top: SizeConfig.getProportionateScreenWidth(15)),
                    alignment: Alignment.center,
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.getProportionateScreenHeight(224),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          style: BorderStyle.solid,
                          width: 1,
                          color: Colors.grey,
                        )),
                    child: Text(
                      'Loading .. ',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
            SizedBox(height: SizeConfig.getProportionateScreenHeight(18)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.getProportionateScreenWidth(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Introduction: What is AI?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: HexColor('333333'),
                    ),
                  ),
                  SizedBox(height: SizeConfig.getProportionateScreenHeight(24)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.only(left: SizeConfig.getProportionateScreenWidth(16)),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // print(' Amir ');
                              openFile(
                                url:
                                    "https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf",
                                //fileName:"gg.jpg"
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.1168224299065421,
                                  height: MediaQuery.of(context).size.height * 0.0539956803455724,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(11),
                                      topRight: Radius.circular(11),
                                      bottomLeft: Radius.circular(11),
                                      bottomRight: Radius.circular(11),
                                    ),
                                    color: Color.fromRGBO(25, 100, 209, 1),
                                  ),
                                  child: Icon(
                                    Icons.menu_book,
                                    color: HexColor('FFFFFF'),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.0086393088552916,
                                ),
                                Text(
                                  'Professeur\n     word',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('333333'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.0747663551401869,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.1168224299065421,
                                  height: MediaQuery.of(context).size.height * 0.0539956803455724,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(11),
                                      topRight: Radius.circular(11),
                                      bottomLeft: Radius.circular(11),
                                      bottomRight: Radius.circular(11),
                                    ),
                                    color: Color.fromRGBO(25, 100, 209, 1),
                                  ),
                                  child: Icon(
                                    Icons.menu_book,
                                    color: HexColor('FFFFFF'),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.0086393088552916,
                                ),
                                Text(
                                  'Discussion\n    ',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('333333'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.0747663551401869,
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (innerContext) {
                                    return AlertDialog(
                                      actionsPadding: EdgeInsetsDirectional.only(
                                        start: 23,
                                        end: 32,
                                      ),
                                      backgroundColor: HexColor('FFFFFF'),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      scrollable: true,
                                      actions: [
                                        Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Questrion 1 out of 10',
                                                    style: TextStyle(
                                                      color: HexColor('1964D1'),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: SizeConfig.getProportionateScreenHeight(8),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '*Choose the correct answer for all questions',
                                                    style: TextStyle(
                                                      color: HexColor('BDBDBD'),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: SizeConfig.getProportionateScreenHeight(24),
                                              ),
                                              Text(
                                                '1: The video that introduced the idea of Hall of Fame and Hall '
                                                'of Shame interfaces included a few pieces of design wisdom.'
                                                ' Which of the following are true? (Select all that apply)',
                                                style: TextStyle(
                                                  color: HexColor('333333'),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              SizedBox(
                                                height: SizeConfig.getProportionateScreenHeight(56),
                                              ),
                                              Column(
                                                children: [
                                                  CheckboxListTile(
                                                    title: Text(
                                                      'Written instructions in any user interface are a sign of bad design.',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w600,
                                                        color: lightSwitches['Ans 1']!
                                                            ? HexColor('0053CB')
                                                            : HexColor('333333'),
                                                      ),
                                                    ),
                                                    value: lightSwitches['Ans 1'],
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        lightSwitches['Ans 1'] = value;
                                                      });
                                                    },
                                                  ),
                                                  CheckboxListTile(
                                                    title: Text(
                                                      'The design principle of Visibility is relevant for both computer interfaces and physical objects.',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w600,
                                                        color: lightSwitches['Ans 2']!
                                                            ? HexColor('0053CB')
                                                            : HexColor('333333'),
                                                      ),
                                                    ),
                                                    value: lightSwitches['Ans 2'],
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        lightSwitches['Ans 2'] = value;
                                                      });
                                                    },
                                                  ),
                                                  CheckboxListTile(
                                                    title: Text(
                                                      'Responding to a user’s action with multiple types of subtle visual feedback is a good design strategy.',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w600,
                                                        color: lightSwitches['Ans 3']!
                                                            ? HexColor('0053CB')
                                                            : HexColor('333333'),
                                                      ),
                                                    ),
                                                    value: lightSwitches['Ans 3'],
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        lightSwitches['Ans 3'] = value;
                                                      });
                                                    },
                                                  ),
                                                  CheckboxListTile(
                                                    title: Text(
                                                      'Simple things should be simple to use.',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w600,
                                                        color: lightSwitches['Ans 4']!
                                                            ? HexColor('0053CB')
                                                            : HexColor('333333'),
                                                      ),
                                                    ),
                                                    value: lightSwitches['Ans 4'],
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        lightSwitches['Ans 4'] = value;
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: SizeConfig.getProportionateScreenHeight(195),
                                              ),
                                              Divider(
                                                height: 2,
                                                color: HexColor('BDBDBD'),
                                              ),
                                              SizedBox(
                                                height: SizeConfig.getProportionateScreenHeight(32),
                                              ),
                                              Container(
                                                width: SizeConfig.getProportionateScreenWidth(316),
                                                height: SizeConfig.getProportionateScreenHeight(56),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8),
                                                  color: HexColor('FFFFFF'),
                                                  border: Border.all(
                                                    color: HexColor('0053CB'),
                                                    width: 2,
                                                    style: BorderStyle.solid,
                                                  ),
                                                ),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    'Next Question',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500,
                                                        color: HexColor('0053CB')),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: SizeConfig.getProportionateScreenHeight(15),
                                              ),
                                              Container(
                                                width: SizeConfig.getProportionateScreenWidth(316),
                                                height: SizeConfig.getProportionateScreenHeight(56),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8),
                                                  color: HexColor('FFFFFF'),
                                                  // border: Border.all(
                                                  //   color: HexColor('0053CB'),
                                                  //   width: 2,
                                                  //   style: BorderStyle.solid,
                                                  // ),
                                                ),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    'Back',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w500,
                                                      color: HexColor('0053CB'),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.1168224299065421,
                                  height: MediaQuery.of(context).size.height * 0.0539956803455724,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(11),
                                      topRight: Radius.circular(11),
                                      bottomLeft: Radius.circular(11),
                                      bottomRight: Radius.circular(11),
                                    ),
                                    color: Color.fromRGBO(25, 100, 209, 1),
                                  ),
                                  child: Icon(
                                    Icons.menu_book,
                                    color: HexColor('FFFFFF'),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.0086393088552916,
                                ),
                                Text(
                                  'Quizzes\n     ',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('333333'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.0747663551401869,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.1168224299065421,
                                  height: MediaQuery.of(context).size.height * 0.0539956803455724,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(11),
                                      topRight: Radius.circular(11),
                                      bottomLeft: Radius.circular(11),
                                      bottomRight: Radius.circular(11),
                                    ),
                                    color: Color.fromRGBO(25, 100, 209, 1),
                                  ),
                                  child: Icon(
                                    Icons.menu_book,
                                    color: HexColor('FFFFFF'),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.0086393088552916,
                                ),
                                Text(
                                  'Assignments\n     ',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('333333'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.0747663551401869,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.1168224299065421,
                                  height: MediaQuery.of(context).size.height * 0.0539956803455724,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(11),
                                      topRight: Radius.circular(11),
                                      bottomLeft: Radius.circular(11),
                                      bottomRight: Radius.circular(11),
                                    ),
                                    color: Color.fromRGBO(25, 100, 209, 1),
                                  ),
                                  child: Icon(
                                    Icons.menu_book,
                                    color: HexColor('FFFFFF'),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.0086393088552916,
                                ),
                                Text(
                                  'Download\n     ',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('333333'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.0259179265658747,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Up Next',
                      style: TextStyle(
                        color: HexColor('1964D1'),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.0259179265658747,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => buildItem(context),
                      separatorBuilder: (context, index) => SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0086393088552916,
                      ),
                      itemCount: 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future openFile({required String url, String? fileName}) async {
    final name = fileName ?? url.split('/').last;
    final file = await downloadFile(url, name);

    if (file == null) return;

    OpenFile.open(file.path);
  }

  /// download file into private folder not visible to user
  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File("${appStorage.path}/$name");

    try {
      final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        ),
      );

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);

      await raf.close();

      return file;
    } catch (_) {
      print('error');
      return null;
    }
  }
}

Widget buildItem(context) => InkWell(
      onTap: () {
        // navigateTo(context, StartScreen());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 83, 203, 0.05000000074505806),
              offset: Offset(6, 6),
              blurRadius: 8,
            )
          ],
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Padding(
          padding: EdgeInsets.only(left: 8),
          child: Row(
            children: <Widget>[
              Container(
                width: SizeConfig.getProportionateScreenWidth(79),
                height: SizeConfig.getProportionateScreenHeight(72),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  image: DecorationImage(
                    image: AssetImage('assets/hateme.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: SizeConfig.getProportionateScreenWidth(8),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Introduction: What is AI ?',
                      textScaleFactor: 1.0,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: HexColor('333333'),
                        // fontFamily: 'SF Pro Display',
                        fontSize: 12,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(8),
                    ),
                    Row(
                      children: <Widget>[
                        Row(
                          children: [
                            Icon(
                              Icons.watch,
                              size: 15,
                            ),
                            SizedBox(
                              width: SizeConfig.getProportionateScreenWidth(6.5),
                            ),
                            Text(
                              '51m',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: HexColor('333333'),
                                fontFamily: 'SF Pro Display',
                                fontSize: 12,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: SizeConfig.getProportionateScreenWidth(17),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.quiz_outlined,
                              size: 15,
                            ),
                            SizedBox(
                              width: SizeConfig.getProportionateScreenWidth(6.5),
                            ),
                            Text(
                              '4',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(51, 51, 51, 1),
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 12,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: SizeConfig.getProportionateScreenWidth(17),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.bookmark_border_outlined,
                              size: 15,
                            ),
                            SizedBox(
                              width: SizeConfig.getProportionateScreenWidth(6.5),
                            ),
                            Text(
                              '2',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(51, 51, 51, 1),
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 12,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
