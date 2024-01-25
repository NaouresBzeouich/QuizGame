import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body:const  QuizPage(),
        ),
      );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> icons = [
    const Text('resultat : ',
    style:  TextStyle(
      color : Colors.white60,
      fontSize: 20.0,
    )
    ),
  ];
  List<String> questions = [
    'La Chandeleur est une fête qui a lieu tous les ans à la même date. Vrai ou faux ?  ',
    'Le lion est un animal qu’on ne trouve en liberté qu’en Afrique. Vrai ou faux ? ',
    'Adolf Hitler était à la tête du Parti national-socialiste des travailleurs allemands, connu en allemand sous le sigle NSDAP. Vrai ou faux ? ',
    'La chanson « La Marseillaise » a été écrite à Strasbourg. Vrai ou faux ? ',
  ];
  List<String> answers = [
    'true',
    'false',
    'true',
    'true',
  ];
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      Stack(
        alignment: const Alignment(0.0,-0.7) ,
        children: <Widget>[
          // Stroked text as border.
          Text(
            'Quiz Game ',
            style: TextStyle(
              fontSize: 80,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 7
                ..color = Colors.deepPurpleAccent,
            ),
          ),
          // Solid text as fill.
          Text(
            'Quiz Game ',
            style: TextStyle(
              fontSize: 80,
              color: Colors.grey[300],
            ),
          ),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            questions[count],
            style: const TextStyle(
                color : Colors.white,
              fontSize: 25.0,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 200),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if(icons.length == 12){
                  icons.removeAt(2);
                }
                if (answers[count] == 'true'){
                  icons.add(const Icon(Icons.check, color: Colors.green));
                }
                else{
                  icons.add(const Icon(Icons.close, color: Colors.red));
                }
                if(count == 3){
                  count = 0;
                }else{
                  count ++;
                }
              });
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(350, 70),
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              side: BorderSide(color: Colors.green[900]! , width: 4),
            ),
            child: const Text(' vrai ',
              style:  TextStyle(
                color : Colors.white,
                fontSize: 30.0,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(

            onPressed: () {
              setState(() {
                if(icons.length == 12){
                  icons.removeAt(2);
                }
                if (answers[count] == 'false'){
                  icons.add(const Icon(Icons.check, color: Colors.green));
                }
                else{
                  icons.add(const Icon(Icons.close, color: Colors.red));
                }
                if(count == 3){
                  count = 0;
                }else{
                  count ++;
                }
              });
            },
              style: ElevatedButton.styleFrom(
              fixedSize: const Size(350, 70),
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                side: BorderSide(color: Colors.red[900]! , width: 4),
            ),
            child: const Text(' faux ',
              style:  TextStyle(
                color : Colors.white,
                fontSize: 30.0,
              ),
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
            width: 350, // Provide a width constraint for the Row
            child: Row(
              children: icons,
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
      ],
      )
    );
  }
}
