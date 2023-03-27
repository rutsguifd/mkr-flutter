import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'MKR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var assetsArr = [
    "assets/q.png",
    "assets/w.png",
    "assets/e.png",
    "assets/r.png"
  ];
  var TitleArr = ["Platapus", "Bear", "Otter", "Horse"];
  var DescArr = [
    "The platypus (Ornithorhynchus anatinus),[3] sometimes referred to as the duck-billed platypus,[4] is a semiaquatic, egg-laying mammal endemic to eastern Australia, including Tasmania. The platypus is the sole living representative or monotypic taxon of its family (Ornithorhynchidae) and genus (Ornithorhynchus), though a number of related species appear in the fossil record.",
    "Bears are carnivoran mammals of the family Ursidae (/ʊrsɪdaɪ/ or /ʊrsɪdiː/). They are classified as caniforms, or doglike carnivorans. Although only eight species of bears are extant, they are widespread, appearing in a wide variety of habitats throughout the Northern Hemisphere and partially in the Southern Hemisphere. Bears are found on the continents of North America, South America, Europe, and Asia.",
    "Otters are carnivorous mammals in the subfamily Lutrinae. The 13 extant otter species are all semiaquatic, aquatic, or marine, with diets based on fish and invertebrates. Lutrinae is a branch of the Mustelidae family, which also includes weasels, badgers, mink, and wolverines, among other animals.",
    "The horse (Equus ferus caballus)[2][3] is a domesticated, one-toed, hoofed mammal. It belongs to the taxonomic family Equidae and is one of two extant subspecies of Equus ferus. The horse has evolved over the past 45 to 55 million years from a small multi-toed creature, Eohippus, into the large, single-toed animal of today. Humans began domesticating horses around 4000 BCE, and their domestication is believed to have been widespread by 3000 BCE. "
  ];

  var nextI = 0;
  void handleNextClick() {
    setState(() {
      nextI = (nextI + 1) % assetsArr.length;
    });
  }

  void handlePrevClick() {
    setState(() {
      nextI = (nextI - 1 + assetsArr.length) % assetsArr.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
          title: Text(widget.title), backgroundColor: Colors.deepPurpleAccent),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              color: Colors.amber,
              margin: const EdgeInsets.only(
                  left: 40.0, right: 40.0, top: 40.0, bottom: 40.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image(
                        width: 200,
                        height: 200,
                        image: AssetImage(assetsArr[nextI])),
                    Text(TitleArr[nextI],
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold)),
                    Text(DescArr[nextI]),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: handleNextClick, child: Text("Next")),
                ElevatedButton(onPressed: handlePrevClick, child: Text("Prev"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
