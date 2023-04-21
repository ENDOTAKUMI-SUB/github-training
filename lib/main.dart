import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*
  コメントの参考記事
  https://qiita.com/chooyan_eng/items/07b8d4b9b3f4c254d542
 */
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /*
    このウィジェットは、アプリケーションのルートとなるものです。
   */
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        /*
        これはアプリケーションのテーマです。
        アプリケーションを "flutter run" コマンドで実行してみてください。
        青いツールバーが表示されるはずです。
        では、アプリは起動したまま、下に書かれた primarySwatch の値を Colors.green に変更して "ホットリロード" を
        実行してみてください（コンソールから "flutter run" で実行している場合は "r" キーを押します。
        Flutter に対応した IDE で実行している場合は単純にファイルを保存すればホットリロードが実行されます）。
        カウンターがゼロに戻ることなく、つまりアプリがリスタートすることはありません。
         */
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  /*
  この Widget はアプリケーションのホームページです。
  これは stateful、つまり State という（この下に定義された）オブジェクトを持っており、
  State には見た目を変化させるためのフィールドが定義されています。

  この MyHomePage という Widget クラスは、
  その State の設定値を保持するクラスです。
  このクラスは親（つまり MyApp） から受け取った値（ここでは title）を保持していて、
  この title は State の build() メソッドで使われています。
  Widget のサブクラスのフィールドは常に "final" でなければなりません。
   */

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    HapticFeedback.mediumImpact();

    setState(() {
      /*
        この setState を呼び出すことで、 Flutter フレームワークに対して
        State が保持する何らかの値が変化したことを伝えます。
        これにより、下に定義した build() メソッドが再度呼び出され、
        変更後の値が画面上の表示内容に反映されます。
        もし _counter の値を setState() を呼び出すことなく変化させた場合、
         build() メソッドが呼び出されずに UI も何も変化しません。
       */

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    /*
      このメソッドは setState が呼び出されるたびに実行され直します。
      例えば、上に定義された _incrementCounter メソッドの実行が完了された後などです。

      フラッターフレームワークはこの build メソッドが高速に呼び出されるように
      最適化されています。
      つまり、Flutter アプリの開発者は UI の更新のために個別の Widget に対して
      何かの更新操作を行うのではなく、必要なタイミングでこの build メソッドを呼び出して
      全体をリビルドできるようになっています。
     */
    return Scaffold(
      appBar: AppBar(
        /*
          ここで、 MyApp の build() メソッドの中で生成され、
          MyHomePage オブジェクトを経由して受け取った文字列を使って
          AppBar のタイトルをセットしています。
         */
        title: Text(widget.title),
      ),
      body: Center(
        /*
          Center はレイアウトのための Widget です。
          子となる Widget をひとつだけ受け取り、親に対して中央寄せになるように配置します。
         */

        child: Column(
          /*
            Column もレイアウトのための Widget です。
            Column は子のリストを受け取り、それを縦に並べます。
            デフォルトでは、子の幅がちょうど収まるだけの幅と、親と同じだけの高さを確保します。

            "debug painting" を実行することで（コンソールでは "p" キーを押します。
            Android Studio の場合は Flutter インスペクタの
            "Toggle Debug Paint" アクションを選択してください。
            Visual Studio の場合は"Toggle Debug Paint" コマンドを選択します）
             それぞれの子Widget のワイヤーフレームを確認できます。

            Column にはどのように自身のサイズを決定し、
            どのように子を配置するかを設定する多くのプロパティが用意されています。
            ここでは、 mainAxisAlignment を指定することで子を縦方向で中心寄せで配置しています。
            なお、 "main axis" とは、 Column においては縦方向の軸を意味します。（
            また、 "cross axis" は横方向です）
           */

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // この末尾のカンマは build メソッドの自動フォーマットを良い感じにするためのものです。
    );
  }
}
