import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'الكتاب المقدس',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'الكتاب المقدس'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool _diacritics = true;
  //Offset _startingFocalPoint;
  //Offset _previousOffset;
  //Offset _offset = Offset.zero;
  //double _previousZoom;
  //double _zoom = 1.0;

  int i = 1;
  String book = "genesis";
  String _currentPath = "assets/genesis/1.txt";
  int _textSize = 1;

  //var bookList = ["genesis", "exodus", "ruth"];

//  Future _nextChapter() async {
//    setState(() {
//      _currentPath = "assets/genesis/2.txt";
//    });
//  }

//  void _scaleStart(ScaleStartDetails details) {
//    setState(() {
//      _startingFocalPoint = details.focalPoint;
//      _previousOffset = _offset;
//      _previousZoom = _zoom;
//    });
//  }

//  void _scale(ScaleUpdateDetails details) {
//    setState(() {
//      _zoom = _previousZoom * details.scale;
//
//      // Ensure that item under the focal point stays in the same place despite zooming
//      final Offset normalizedOffset = (_startingFocalPoint - _previousOffset) / _previousZoom;
//      _offset = details.focalPoint - normalizedOffset * _zoom;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.search, color: Colors.white,),
//            onPressed: (){},
//          ),
          IconButton(
            icon: Icon(Icons.zoom_out, color: Colors.white,),
            onPressed: (){
              setState(() {
                _textSize = _textSize == 1 ? 1 : _textSize - 1;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.zoom_in, color: Colors.white,),
            onPressed: (){
              setState(() {
                _textSize = _textSize == 4 ? 4 : _textSize + 1;
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: FutureBuilder(
              future: DefaultAssetBundle.of(context).loadString('$_currentPath'),
              builder: (context, snapshot){
                var str = _diacritics ? snapshot.data.toString() : _removeDiacritics(snapshot.data.toString());
                var _txtStyle;
                switch(_textSize){
                  case 1:
                    _txtStyle = Theme.of(context).textTheme.display1;
                    break;
                  case 2:
                    _txtStyle = Theme.of(context).textTheme.display2;
                    break;
                  case 3:
                    _txtStyle = Theme.of(context).textTheme.display3;
                    break;
                  case 4:
                    _txtStyle = Theme.of(context).textTheme.display4;
                    break;
                }
                return Text('$str',
                  style: _txtStyle,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  softWrap: true,
                );
              },
            ),
          ),
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        tooltip: 'Highlighted',
//        child: Icon(Icons.star),
//        onPressed: (){},
//      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        onTap: (index){
          setState(() {
            switch(index){
              case 0:
                if(book == "john2" || book == "john3" || book == "jude" || book == "obadiah" || book == "phillemon") {break;}
                if(book == "acts" && i < 28){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "amos" && i < 9){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "baruch_deu" && i < 6){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "chronicles1" && i < 29){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "chronicles2" && i < 36){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "colossians" && i < 4){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "corinthians1" && i < 16){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "corinthians2" && i < 13){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "daniel1" && i < 12){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "daniel2" && i < 3){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "deuteronomy" && i < 34){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "ecclesiastes" && i < 12){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "ephesians" && i < 6){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "esther" && i < 16){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "exodus" && i < 40){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "ezekiel" && i < 48){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "ezra" && i < 10){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "galatians" && i < 6){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "genesis" && i < 50){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "habakuk" && i < 3){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "haggai" && i < 2){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "hebrews" && i < 13){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "hosea" && i < 14){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "isiah" && i < 66){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "james" && i < 5){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "jeremiah" && i < 52){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "job" && i < 42){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "joel" && i < 3){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "john" && i < 21){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "john1" && i < 5){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "jonah" && i < 4){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "joshua" && i < 24){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "judges" && i < 21){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "judith_deu" && i < 16){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "kings1" && i < 22){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "kings2" && i < 25){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "lamentations" && i < 5){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "leviticus" && i < 27){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "luke" && i < 24){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "maccabees1_deu" && i < 16){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "maccabees2_deu" && i < 15){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "malachi" && i < 4){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "mark" && i < 16){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "matthew" && i < 28){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "micah" && i < 7){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "nahum" && i < 3){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "numbers" && i < 36){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "peter1" && i < 5){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "peter2" && i < 3){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "philipians" && i < 4){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "proverbs" && i < 31){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "psalms" && i < 151){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "revelation" && i < 22){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "romans" && i < 16){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "ruth" && i < 4){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "samuel1" && i < 31){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "samuel2" && i < 24){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "sirach_deu" && i < 51){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "song_of_songs" && i < 8){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "thessalonians1" && i < 5){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "thessalonians2" && i < 3){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "timothy1" && i < 6){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "timothy2" && i < 4){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "titus" && i < 3){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "tobit_deu" && i < 14){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "zechariah" && i < 14){ i++;_currentPath = "assets/$book/$i.txt";break;}
                if(book == "zephaniah" && i < 3){ i++;_currentPath = "assets/$book/$i.txt";break;}
                break;
              case 1:
                _diacritics = _diacritics ? false : true;
                break;
              case 2:
                //all books
                showDialog(context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title: const Text('اختر السِفر', textAlign: TextAlign.center,),
                    children: <Widget>[
                      SimpleDialogOption(child: const Text('سِفْرُ التَّكْوِينِ', textAlign: TextAlign.center,), onPressed: () {book = "genesis";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر اَلْخُرُوجُ', textAlign: TextAlign.center,), onPressed: () {book = "exodus";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر اللاويين', textAlign: TextAlign.center,), onPressed: () {book = "leviticus";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر اَلْعَدَد', textAlign: TextAlign.center,), onPressed: () {book = "numbers";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر اَلتَّثْنِيَة', textAlign: TextAlign.center,), onPressed: () {book = "deuteronomy";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر يَشُوع', textAlign: TextAlign.center,), onPressed: () {book = "joshua";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر اَلْقُضَاة', textAlign: TextAlign.center,), onPressed: () {book = "judges";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر رَاعُوث', textAlign: TextAlign.center,), onPressed: () {book = "ruth";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر صَمُوئِيلَ الأَوَّلُ', textAlign: TextAlign.center,), onPressed: () {book = "samuel1";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر صَمُوئِيلَ الثَّانِي', textAlign: TextAlign.center,), onPressed: () {book = "samuel2";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر اَلْمُلُوكِ الأَوَّلُ', textAlign: TextAlign.center,), onPressed: () {book = "kings1";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر اَلْمُلُوكِ الثَّانِي', textAlign: TextAlign.center,), onPressed: () {book = "kings2";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر أَخْبَارِ الأَيَّامِ الأَوَّلُ', textAlign: TextAlign.center,), onPressed: () {book = "chronicles1";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر أَخْبَارِ الأَيَّامِ الثَّانِي', textAlign: TextAlign.center,), onPressed: () {book = "chronicles2";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('عَزْرَا', textAlign: TextAlign.center,), onPressed: () {book = "ezra";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر طوبيا', textAlign: TextAlign.center,), onPressed: () {book = "tobit_deu";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر يهوديت', textAlign: TextAlign.center,), onPressed: () {book = "judith_deu";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر أَسْتِير', textAlign: TextAlign.center,), onPressed: () {book = "esther";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      //SimpleDialogOption(child: const Text('esther_the_rest_deu'), onPressed: () {book = "esther_the_rest_deu";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر أَيُّوبَ', textAlign: TextAlign.center,), onPressed: () {book = "job";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر اَلْمَزَامِيرُ', textAlign: TextAlign.center,), onPressed: () {book = "psalms";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر أَمْثَالٌ', textAlign: TextAlign.center,), onPressed: () {book = "proverbs";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر اَلْجَامِعَةِ', textAlign: TextAlign.center,), onPressed: () {book = "ecclesiastes";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر نَشِيدُ الأَنْشَادِ', textAlign: TextAlign.center,), onPressed: () {book = "song_of_songs";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر يشوع بن سيراخ', textAlign: TextAlign.center,), onPressed: () {book = "sirach_deu";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر إِشَعْيَاءَ', textAlign: TextAlign.center,), onPressed: () {book = "isiah";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر إِرْمِيَا', textAlign: TextAlign.center,), onPressed: () {book = "jeremiah";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر مَرَاثِي إِرْمِيَا', textAlign: TextAlign.center,), onPressed: () {book = "lamentations";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر باروخ', textAlign: TextAlign.center,), onPressed: () {book = "baruch_deu";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر حِزْقِيَال', textAlign: TextAlign.center,), onPressed: () {book = "ezekiel";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر دَانِيآل', textAlign: TextAlign.center,), onPressed: () {book = "daniel1";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('تتمة سفر دانيال', textAlign: TextAlign.center,), onPressed: () {book = "daniel2";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر هُوشَع', textAlign: TextAlign.center,), onPressed: () {book = "hosea";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر يُوئِيل', textAlign: TextAlign.center,), onPressed: () {book = "joel";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر عَامُوس', textAlign: TextAlign.center,), onPressed: () {book = "amos";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر عُوبَدْيَا', textAlign: TextAlign.center,), onPressed: () {book = "obadiah";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر يُونَان', textAlign: TextAlign.center,), onPressed: () {book = "jonah";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر مِيخَا', textAlign: TextAlign.center,), onPressed: () {book = "micah";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر نَاحُوم', textAlign: TextAlign.center,), onPressed: () {book = "nahum";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر حَبَقُّوق', textAlign: TextAlign.center,), onPressed: () {book = "habakuk";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر صَفَنْيَا', textAlign: TextAlign.center,), onPressed: () {book = "zephaniah";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر حَجَّي', textAlign: TextAlign.center,), onPressed: () {book = "haggai";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر زَكَريَّا', textAlign: TextAlign.center,), onPressed: () {book = "zechariah";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر مَلاَخِي', textAlign: TextAlign.center,), onPressed: () {book = "malachi";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر مكابيين الأول', textAlign: TextAlign.center,), onPressed: () {book = "maccabees1_deu";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر المكابيين الثاني', textAlign: TextAlign.center,), onPressed: () {book = "maccabees2_deu";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('إنجيل مَتَّى', textAlign: TextAlign.center,), onPressed: () {book = "matthew";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('انجيل لُوقَا', textAlign: TextAlign.center,), onPressed: () {book = "luke";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('إنجيل مرقس', textAlign: TextAlign.center,), onPressed: () {book = "mark";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('إِنْجِيلُ يُوحَنَّا', textAlign: TextAlign.center,), onPressed: () {book = "john";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('سفر أَعْمَالُ الرُّسُلِ', textAlign: TextAlign.center,), onPressed: () {book = "acts";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('رِسَالَةُ بُولُسَ الرَّسُولِ إِلَى أَهْلِ رُومِيَةَ', textAlign: TextAlign.center,), onPressed: () {book = "romans";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('رِسَالَةُ بُولُسَ الرَّسُولِ الأُولَى إِلَى أَهْلِ كُورِنْثُوسَ', textAlign: TextAlign.center,), onPressed: () {book = "corinthians1";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('رِسَالَةُ بُولُسَ الرَّسُولِ الثَّانِيةُ إِلَى أَهْلِ كُورِنْثُوسَ', textAlign: TextAlign.center,), onPressed: () {book = "corinthians2";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('رِسَالَةُ بُولُسَ الرَّسُولِ إِلَى أَهْلِ غَلاَطِيَّةَ', textAlign: TextAlign.center,), onPressed: () {book = "galatians";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('رِسَالَةُ بُولُسَ الرَّسُولِ إِلَى أَهْلِ أَفَسُسَ', textAlign: TextAlign.center,), onPressed: () {book = "ephesians";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('رساله بُولُسَ الرَّسُولِ إِلَى أَهْلِ فِيلِبِّي', textAlign: TextAlign.center,), onPressed: () {book = "philipians";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('رِسَالَةُ بُولُسَ الرَّسُولِ إِلَى أَهْلِ كُولُوسِّي', textAlign: TextAlign.center,), onPressed: () {book = "colossians";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('رِسَالَةُ بُولُسَ الرَّسُولِ الأُولَى إِلَى أَهْلِ تَسَالُونِيكِي', textAlign: TextAlign.center,), onPressed: () {book = "thessalonians1";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('رِسَالَةُ بُولُسَ الرَّسُولِ الثَّانِيةُ إِلَى أَهْلِ تَسَالُونِيكِي', textAlign: TextAlign.center,), onPressed: () {book = "thessalonians2";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('رِسَالَةُ بُولُسَ الرَّسُولِ الأُولَى إِلَى تِيمُوثَاوُسَ', textAlign: TextAlign.center,), onPressed: () {book = "timothy1";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('رِسَالَةُ بُولُسَ الرَّسُولِ الثَّانِيةُ إِلَى تِيمُوثَاوُسَ', textAlign: TextAlign.center,), onPressed: () {book = "timothy2";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('رِسَالَةُ بُولُسَ الرَّسُولِ إِلَى تِيطُسَ', textAlign: TextAlign.center,), onPressed: () {book = "titus";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('رِسَالَةُ بُولُسَ الرَّسُولِ إِلَى فِلِيمُونَ', textAlign: TextAlign.center,), onPressed: () {book = "phillemon";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('اَلرِّسَالَةُ إِلَى الْعِبْرَانِيِّينَ', textAlign: TextAlign.center,), onPressed: () {book = "hebrews";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('رِسَالَةُ يَعْقُوبَ', textAlign: TextAlign.center,), onPressed: () {book = "james";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('رِسَالَةُ بُطْرُسَ الرَّسُولِ الأُولَى', textAlign: TextAlign.center,), onPressed: () {book = "peter1";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('رِسَالَةُ بُطْرُسَ الرَّسُولِ الثَّانِيَةُ', textAlign: TextAlign.center,), onPressed: () {book = "peter2";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('رِسَالَةُ يُوحَنَّا الرَّسُولِ الأُولَى', textAlign: TextAlign.center,), onPressed: () {book = "john1";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('رِسَالَةُ يُوحَنَّا الرَّسُولِ الثَّانِيَةُ', textAlign: TextAlign.center,), onPressed: () {book = "john2";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('رِسَالَةُ يُوحَنَّا الرَّسُولِ الثَّالِثَةُ', textAlign: TextAlign.center,), onPressed: () {book = "john3";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('رسالة يَهُوذَا', textAlign: TextAlign.center,), onPressed: () {book = "jude";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                      SimpleDialogOption(child: const Text('رُؤْيَا يُوحَنَّا اللاَّهُوتِيِّ', textAlign: TextAlign.center,), onPressed: () {book = "revelation";Navigator.pop(context, [""]);setState(() {_currentPath="assets/$book/1.txt";});},),
                    ],
                  );
                }
                );
                break;
              case 3:
                i = (i > 1) ? --i : 1;
                _currentPath = "assets/$book/$i.txt";
                break;
            }
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back_ios, color: Colors.blue,),
            title: Text('التالي', style: TextStyle(color: Colors.blue),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_paint, color: Colors.blue,),
            title: Text('التشكيل',
            style: TextStyle(color: Colors.blue),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book, color: Colors.blue,),
            title: Text('الأسفار',
              style: TextStyle(color: Colors.blue),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward_ios, color: Colors.blue,),
            title: Text('السابق',
              style: TextStyle(color: Colors.blue),),
          ),
        ],
      ),
    );
  }

  String normalize(String input) {
    return input.replaceAll('\u0610', '')
        .replaceAll('\u0611', '')
        .replaceAll('\u0612', '')
        .replaceAll('\u0613', '')
        .replaceAll('\u0614', '')
        //.replaceAll('\u0615', '')
        //.replaceAll('\u0616', '')
        //.replaceAll('\u0617', '')
        //.replaceAll('\u0618', '')
        //.replaceAll('\u0619', '')
        //.replaceAll('\u061A', '')
        //.replaceAll('\u06D6', '')
        //.replaceAll('\u06D7', '')
        //.replaceAll('\u06D8', '')
        //.replaceAll('\u06D9', '')
        //.replaceAll('\u06DA', '')
        //.replaceAll('\u06DB', '')
        //.replaceAll('\u06DC', '')
        //.replaceAll('\u06DD', '')
        //.replaceAll('\u06DE', '')
        //.replaceAll('\u06DF', '')
        //.replaceAll('\u06E0', '')
        //.replaceAll('\u06E1', '')
        //.replaceAll('\u06E2', '')
        //.replaceAll('\u06E3', '')
        //.replaceAll('\u06E4', '')
        //.replaceAll('\u06E5', '')
        //.replaceAll('\u06E6', '')
        //.replaceAll('\u06E7', '')
        //.replaceAll('\u06E8', '')
        //.replaceAll('\u06E9', '')
        //.replaceAll('\u06EA', '')
        //.replaceAll('\u06EB', '')
        //.replaceAll('\u06EC', '')
        //.replaceAll('\u06ED', '')
        //.replaceAll('\u0640', '')
        //.replaceAll('\u064B', '')
        .replaceAll('\u064C', '')
        .replaceAll('\u064D', '')
        .replaceAll('\u064E', '')
        .replaceAll('\u064F', '')
        .replaceAll('\u0650', '')
        .replaceAll('\u0651', '')
        .replaceAll('\u0652', '')
        .replaceAll('\u0653', '')
        .replaceAll('\u0654', '')
        .replaceAll('\u0655', '')
        .replaceAll('\u0656', '')
        .replaceAll('\u0657', '')
        .replaceAll('\u0658', '')
        .replaceAll('\u0659', '')
        .replaceAll('\u065A', '')
        .replaceAll('\u065B', '')
        .replaceAll('\u065C', '')
        .replaceAll('\u065D', '')
        .replaceAll('\u065E', '')
        .replaceAll('\u065F', '')
        .replaceAll('\u0670', '');
        //.replaceAll('\u0624', '\u0648')
        //.replaceAll('\u0629', '\u0647')
        //.replaceAll('\u064A', '\u0649')
        //.replaceAll('\u0626', '\u0649')
        //.replaceAll('\u0622', '\u0627')
        //.replaceAll('\u0623', '\u0627')
        //.replaceAll('\u0625', '\u0627');
  }

  _removeDiacritics(String string) {
    return normalize(string);
  }

//  Future<void> _getLastRead() async {
//    final prefs = await SharedPreferences.getInstance();
//    setState(() {
//      book = prefs.getString('book') ?? "genesis";
//      i = prefs.getInt('i') ?? 1;
//    });
//  }
}
