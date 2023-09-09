// packages
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class private extends StatefulWidget {
  const private({super.key});

  @override
  State<private> createState() => _privateState();
}

class _privateState extends State<private> {
  // for camera
  File? image;
  dynamic initial_face;
  //for stripts
  String namae_screen = "";
  String name_screen = "";
  String mail_screen = "";
  String phone_screen = "";
  String line_screen = "";
  String twitter_screen = "";
  // for sending SMS
  String sending_number_private = "";
  // function
  // image_pickerで画像の取得。保存はしてない
  Future<void> getimage() async {
    final picker = ImagePicker();
    final pickedfile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedfile != null) {
      image = File(pickedfile.path);
    }
  }

  // remove
  Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

// 画像の保存
  Future<void> saveimage() async {
    if (image != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("face_picture_for_private", image!.path);
    }
  }

// 画像を呼ぶ
  Future<void> setimage() async {
    final prefs = await SharedPreferences.getInstance();
    final String? imagepath = prefs.getString("face_picture_for_private");
    if (imagepath != null) {
      image = File(imagepath);
    } else {
      initial_face = Image.asset(
        "images/face_template.png",
        height: 200,
      );
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    // 画像呼び出し
    setimage();
    // 名前呼び出し
    set_namae();
    // name呼び出し
    set_name();
    // メール呼び出し
    set_mail();
    // 電話呼び出し
    set_phone();
    // line呼び出し
    set_line();
    // twitter呼び出し
    set_twitter();
    super.initState();
  }

// 名前の保存
  Future<void> save_namae(String newtext) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("namae_for_private", newtext);
  }

// 名前呼び出し
  void set_namae() async {
    // おまじない
    final prefs = await SharedPreferences.getInstance();
    // nameのvalueを取り出して、表示する変数名に代入。 ?? "~~"は、なかったら”〜”が表示される。設定しなきゃエラーになる
    namae_screen = await prefs.getString("namae_for_private") ?? "";
    // 画面の更新。initstateの中で呼び出しても更新されないため、関数の中で更新する
    setState(() {});
  }

// nameの保存
  Future<void> save_name(String newtext) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("name_for_private", newtext);
  }

// name呼び出し
  void set_name() async {
    // おまじない
    final prefs = await SharedPreferences.getInstance();
    // nameのvalueを取り出して、表示する変数名に代入。 ?? "~~"は、なかったら”〜”が表示される。設定しなきゃエラーになる
    name_screen = await prefs.getString("name_for_private") ?? "";
    // 画面の更新。initstateの中で呼び出しても更新されないため、関数の中で更新する
    setState(() {});
  }

// メールの保存
  Future<void> save_mail(String newtext) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("mail_for_private", newtext);
  }

// メール呼び出し
  void set_mail() async {
    // おまじない
    final prefs = await SharedPreferences.getInstance();
    // nameのvalueを取り出して、表示する変数名に代入。 ?? "~~"は、なかったら”〜”が表示される。設定しなきゃエラーになる
    mail_screen = await prefs.getString("mail_for_private") ?? "";
    // 画面の更新。initstateの中で呼び出しても更新されないため、関数の中で更新する
    setState(() {});
  }

// 電話の保存
  Future<void> save_phone(String newtext) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("phone_for_private", newtext);
  }

// 電話呼び出し
  void set_phone() async {
    // おまじない
    final prefs = await SharedPreferences.getInstance();
    // nameのvalueを取り出して、表示する変数名に代入。 ?? "~~"は、なかったら”〜”が表示される。設定しなきゃエラーになる
    phone_screen = await prefs.getString("phone_for_private") ?? "";
    // 画面の更新。initstateの中で呼び出しても更新されないため、関数の中で更新する
    setState(() {});
  }

// lineの保存
  Future<void> save_line(String newtext) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("line_for_private", newtext);
  }

// line呼び出し
  void set_line() async {
    // おまじない
    final prefs = await SharedPreferences.getInstance();
    // nameのvalueを取り出して、表示する変数名に代入。 ?? "~~"は、なかったら”〜”が表示される。設定しなきゃエラーになる
    line_screen = await prefs.getString("line_for_private") ?? "";
    // 画面の更新。initstateの中で呼び出しても更新されないため、関数の中で更新する
    setState(() {});
  }

// twitterの保存
  Future<void> save_twitter(String newtext) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("twitter_for_private", newtext);
  }

// twitter呼び出し
  void set_twitter() async {
    // おまじない
    final prefs = await SharedPreferences.getInstance();
    // nameのvalueを取り出して、表示する変数名に代入。 ?? "~~"は、なかったら”〜”が表示される。設定しなきゃエラーになる
    twitter_screen = await prefs.getString("twitter_for_private") ?? "";
    // 画面の更新。initstateの中で呼び出しても更新されないため、関数の中で更新する
    setState(() {});
  }

// launch_urlの起動
  Future<void> launch_url(String script) async {
    if (!await launchUrl(Uri.parse(script))) {
      throw launchUrl(Uri.parse(script));
    }
  }

// screenshotのcontroller設定
  ScreenshotController screenshotController = ScreenshotController();

// 「記録しました！」のsnack bar
  void record() {
    SnackBar snackbar = SnackBar(
        content: Text('変更を保存しました！'),
        //snack barの表示時間。これは３秒
        duration: Duration(seconds: 3));
    //snack barの実行
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Private card"),
        actions: [
          IconButton(
              onPressed: () async {
                String share_mail_title_private = "${namae_screen}です！初めまして！";
                String share_scripts_private = """
  名前:  ${namae_screen} 
  Name:  ${name_screen} 
  メールアドレス:  ${mail_screen} 
  TEL:  ${phone_screen}
  Line: ${line_screen}
  Twitter: ${twitter_screen}""";
                // 画像の取得
                final raw_image = await screenshotController
                    .capture(delay: const Duration(milliseconds: 10))
                    .then((raw_image) async {
                  if (raw_image != null) {
                    //path_provierでフォルダまでのdirectoryの特定
                    final directory_to_folder =
                        (await getApplicationDocumentsDirectory()).path;
                    // 上でフォルダまでは認識したのでパス+保存する画像の名前をここで登録し、変数に入れる
                    final full_path_screenshot = await File(
                            "${directory_to_folder}/face_image_private.png")
                        .create();
                    // 撮った画像のfile形式の変更
                    await full_path_screenshot.writeAsBytes(raw_image);

                    // share_plusを使ってシェアする
                    await Share.shareXFiles([
                      XFile(full_path_screenshot.path),
                    ],
                        subject: share_mail_title_private,
                        text: share_scripts_private);
                  }
                });
              },
              icon: Icon(Icons.share)),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              GestureDetector(
                child: image != null
                    ? Screenshot(
                        controller: screenshotController,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            image!,
                            height: 200,
                          ),
                        ),
                      )
                    : Screenshot(
                        controller: screenshotController,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: initial_face),
                      ),
                onTap: () async {
                  await getimage();
                  await showDialog(
                      // おまじない
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            // ウインドウ左上に表示させるもの
                            title: Text("写真選択"),
                            // 内容入力
                            content: Text("選択した写真に変更する?"),
                            // ボタン。任意、書かなくてもいい
                            actions: [
                              TextButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    // shered_preferencesに記録した写真を削除
                                    remove("face_picture_for_private");
                                    // 選択した写真の記録
                                    saveimage();
                                    // 写真の更新
                                    setimage();
                                    // 画面に戻る
                                    Navigator.pop(context);
                                    // 画面の更新
                                    setState(() {}); // 変数の設定
                                    SnackBar snackbar = SnackBar(
                                        content: Text('写真を変更しました！'),
                                        //snack barの表示時間。これは３秒
                                        duration: Duration(seconds: 3));
                                    //snack barの実行
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackbar);
                                    // *この時mainからextractしないで一気に書いてしまうとエラーになる（多分contextで元がいないのが原因）
                                    //使うときは「home: mainpage()」のようにstatefulを分岐させて使う）
                                  }), // 「Navigator.pop(context);」は何も起きないで暗くなったページが元に戻る
                              TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                            ]);
                      });
                },
              ),
              Container(
                  width: 150,
                  child: namefield(
                      hinttext: "お名前",
                      controller: TextEditingController(text: namae_screen),
                      onchangedfunction: (newtext) {
                        save_namae(newtext);
                        record();
                      })),
              Container(
                  width: 150,
                  child: namefield(
                      hinttext: "Name",
                      controller: TextEditingController(text: name_screen),
                      onchangedfunction: (newtext) {
                        save_name(newtext);
                        record();
                      })),
              SizedBox(
                height: 30,
              ),
              // mailから下
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text("Mail:"),
                  Container(
                      width: 280,
                      child: namefield(
                          hinttext: "Mail Address",
                          controller: TextEditingController(text: mail_screen),
                          onchangedfunction: (newtext) {
                            save_mail(newtext);
                            record();
                          })),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text("Line:"),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      width: 240,
                      child: namefield(
                          hinttext: "Line ID",
                          controller: TextEditingController(text: line_screen),
                          onchangedfunction: (newtext) {
                            save_line(newtext);
                            record();
                          })),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text("Twitter:"),
                  Container(
                      width: 250,
                      child: namefield(
                          hinttext: "Twitter Name",
                          controller:
                              TextEditingController(text: twitter_screen),
                          onchangedfunction: (newtext) {
                            save_twitter(newtext);
                            record();
                          })),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("TEL:"),
                  SizedBox(
                    width: 60,
                  ),
                  Container(
                      width: 180,
                      child: namefield(
                          hinttext: "Phone Number",
                          controller: TextEditingController(text: phone_screen),
                          onchangedfunction: (newtext) {
                            save_phone(newtext);
                            record();
                          })),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () async {
                          showDialog(
                              // おまじない
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    // ウインドウ左上に表示させるもの
                                    title: Text(
                                      "SMSで自己紹介しよう！(写真無し)",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    // 内容入力
                                    content: TextField(
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      onChanged: (newtext) {
                                        sending_number_private = newtext;
                                      },
                                      decoration: InputDecoration(
                                          hintText: "例) 09011112222"),
                                    ),
                                    // ボタン。任意、書かなくてもいい
                                    actions: [
                                      // 「Navigator.pop(context);」は何も起きないで暗くなったページが元に戻る
                                      TextButton(
                                        child: Text("OK"),
                                        onPressed: () async {
                                          // contents for SMS
                                          String sms_contents_private = """
  名前:  ${namae_screen}
  Name:  ${name_screen}
  メールアドレス:  ${mail_screen}
  TEL:  ${phone_screen}
  Line: ${line_screen}
  Twitter: ${twitter_screen}""";
                                          await launch_url(
                                              "sms:${sending_number_private}?body=${sms_contents_private}");
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ]);
                              });
                        },
                        child: Icon(
                          Icons.sms,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class namefield extends StatelessWidget {
  String hinttext;
  void Function(String) onchangedfunction;
  TextEditingController controller;

  namefield(
      {required this.hinttext,
      required this.controller,
      required this.onchangedfunction});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(hintText: hinttext, border: InputBorder.none),
      textAlign: TextAlign.center,
      controller: controller,
      onSubmitted: (newtext) {
        onchangedfunction(newtext);
      },
    );
  }
}
