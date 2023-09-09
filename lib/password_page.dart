// packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
// dart files
import 'list_page.dart';
import 'registration_page.dart';

class authorization_screen extends StatefulWidget {
  const authorization_screen({super.key});

  @override
  State<authorization_screen> createState() => _authorization_screenState();
}

class _authorization_screenState extends State<authorization_screen> {
  // variable for password
  String password = "";
  String manual_password = "";

  // function
  call() async {
    final prefs = await SharedPreferences.getInstance();
    password = await prefs.getString("password") ?? "";
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    call();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ログイン"),
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("ログイン画面",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                SizedBox(height: 65),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    //trueで画面が出た時点で入力スタンバイ状態になる
                    autofocus: true,
                    decoration: InputDecoration(
                      // 背景の設定をオンにする場合、trueにする
                      filled: true,
                      // 入力ウインドウの背景の色の選択
                      fillColor: Color.fromARGB(255, 255, 253, 253),
                      // 入力欄が空欄の場合の初期メッセージ
                      hintText: "Password",
                      //テキストフィールドウインドウを線で囲む。入力しない場合、下線だけになる
                      border: OutlineInputBorder(),
                      // 入力枠の右上に文字を追加する
                      labelText: 'Password',
                      // テキストフォームに入力したら（）内に内容が入る、{}内はproviderのやり方
                      // onChanged:入力した瞬間に反映
                      // onSubmitted:キーボードの入力を確定させた時点で反映
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]'))
                    ],
                    keyboardType: TextInputType.multiline,
                    // 初期値にパスワード入れとくところ。（できなかった。履歴としてコメントアウト）
                    // controller: TextEditingController(text: password),
                    onChanged: (newtext) {
                      manual_password = newtext;
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (password == manual_password) {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => list_page()),
                        );
                      } else {
                        SnackBar snackbar = SnackBar(
                            content: Text('パスワードが違います。'),
                            //snack barの表示時間。これは３秒
                            duration: Duration(seconds: 3));
                        //snack barの実行
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }
                    },

                    // 初期値にパスワード入れてログインボタン押すだけにしたかったところ。（できなかった。履歴としてコメントアウト）
                    // if (password == password) {
                    //   Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => list_page()),
                    //   );
                    // }

                    child: Text("ログイン",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("新規登録は"),
                    TextButton(
                        child: Text("こちら"),
                        onPressed: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => registration_page()),
                          );
                          // 上のawaitで処理待っててcall関数を呼び出すことにより、新たに記録されたpasswordを変数に代入させて変数の更新をしてる
                          call();
                        })
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
