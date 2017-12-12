import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';


// Uncomment lines 7 and 10 to view the visual layout at runtime.
//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
//  debugPaintSizeEnabled = true;
//  imageCache.maximumSize = 5;
  runApp(new MaterialApp(
    title: 'Flutter List View',
    home: new MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  @override
  MyAppState createState(){
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp>{
  bool clear = false;

  Widget creatCard(String url){
    Image image = new Image.network(
      url,
      key: new GlobalKey(debugLabel: url),
      width: 750.0,
      height: 280.0,
      fit: BoxFit.cover,
    );
    Widget click = new InkWell(onTap: (){
          setState((){
            clear = true;
          });
        },
        child: image);
    return new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [click, new Text(url)],
      ),
    );
  }

  Widget build(BuildContext context) {
    if (clear) return new Text('empty');

    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Flutter List View')),
        body: new ListView.builder(
          itemBuilder: (BuildContext context, int index){
            List<String> imageUrls = getImageUrls().toList();
            String url = imageUrls[index];
            return creatCard(url);
          },
          itemCount: getImageUrls().toList().length,
        ),
      ),
    );
  }
}

Set<String> getImageUrls() {
  const String imageUrl = 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Googleplex-Patio-Aug-2014.JPG/640px-Googleplex-Patio-Aug-2014.JPG';
  return new List.generate(40, (int i) => '$imageUrl?x=$i').toSet();
}
