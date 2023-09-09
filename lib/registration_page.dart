// packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // used for textfield's FilteringTextInputFormatter function
import 'package:shared_preferences/shared_preferences.dart';

class registration_page extends StatefulWidget {
  const registration_page({super.key});

  @override
  State<registration_page> createState() => _registration_pageState();
}

class _registration_pageState extends State<registration_page> {
  PageController pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("新規登録画面"),
        ),
        body: PageView(
          controller: pagecontroller,
          reverse: false, //trueでスクロール方向を逆にする
          pageSnapping: true, //trueでスワイプした時にどっちかになる。falseで中途半端に止まれる
          // scrollDirection: Axis.vertical, //スクロールを縦に変更
          children: [
            page1(),
            page2(
                pagecontroller) //ページ２でalartdialogで「OK」を押したときにpage1に自動で戻すために、pageviewのpagecontrollerを渡すために引数に入れた
          ],
        ));
  }
}

// page1
class page1 extends StatefulWidget {
  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  // variable for password
  String password = "初期値";
  // controller for textfield
  TextEditingController controller = TextEditingController();
  // for shared_preferences
  // password_save
  void save() async {
    if (controller.text == "") {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("もう１回入力しよう！"),
              actions: [
                TextButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            );
          });
    } else {
      // setting for shared_preference
      password = controller.text;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("password", password);
      // setting for snackbar
      SnackBar snackBar = SnackBar(
          content: Text('登録完了！ログインしよう！'), duration: Duration(seconds: 3));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // main password画面に戻る
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              //trueで画面が出た時点で入力スタンバイ状態になる
              autofocus: true,
              decoration: InputDecoration(
                // 背景の設定をオンにする場合、trueにする
                filled: true,
                // 入力ウインドウの背景の色の選択
                fillColor: Color.fromARGB(255, 255, 255, 255),
                // 入力欄が空欄の場合の初期メッセージ
                hintText: "半角英数",
                //テキストフィールドウインドウを線で囲む。入力しない場合、下線だけになる
                border: OutlineInputBorder(),
                // 入力枠の右上に文字を追加する
                labelText: "パスワード作成",
                // テキストフォームに入力したら（）内に内容が入る、{}内はproviderのやり方
                // onChanged:入力した瞬間に反映
                // onSubmitted:キーボードの入力を確定させた時点で反映
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]'))
              ],
              keyboardType: TextInputType.multiline,
            ),
          ),
          ElevatedButton(onPressed: save, child: Text("登録")),
        ],
      ),
    );
  }
}

// page2
class page2 extends StatefulWidget {
  // const page2({super.key});

  // ページ２からalertdialogで「OK」を押したときにページ１へジャンプするために以下のコマンドが必要だった（ChatGPT調べ）
  // また、このジャンプを実現させるために、上の「const page2({super.key});」をコメントアウトしなければならなかった。外すとエラーになる。
  // また、これに伴い、registration_pageのページ２へ移動の際に、引数として「pagecontroller」を入れる必要が出てきた。
  // おそらくregistration_page の「pageview」の「pagecontroller」を承継して使えるようにしてるんだと思う
  PageController pagecontroller = PageController();
  // 引数の強制を定義したんだと思う
  page2(this.pagecontroller);

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  void remove() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Confirmation"),
                          content: Text("本当に初期化する？"),
                          actions: [
                            TextButton(
                                child: Text("OK"),
                                onPressed: () {
                                  // パスワード初期化作業
                                  remove();
                                  // show snackbar
                                  SnackBar snackBar = SnackBar(
                                      content: Text("パスワードを初期化しました。再登録しよう！"),
                                      duration: Duration(seconds: 3));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  // ポップアップ閉じる
                                  Navigator.of(context).pop();
                                  // パスワード登録画面にジャンプさせる。
                                  // widgetは「pagecontroller」を承継してるんだと思う。
                                  widget.pagecontroller.animateToPage(0,
                                      // ジャンプした時の戻る速さ
                                      duration: Duration(seconds: 1),
                                      // 画面の戻り方。下に一覧見つけた
                                      // https://api.flutter.dev/flutter/animation/Curves-class.html
                                      curve: Curves.ease);
                                }),
                            TextButton(
                                child: Text("Cancel"),
                                onPressed: () {
                                  Navigator.pop(context);
                                })
                          ],
                        );
                      });
                },
                child: Text("パスワード初期化ボタン")),
          ],
        ),
      ),
    );
  }
}
