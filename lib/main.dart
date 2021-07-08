import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:translator/translator.dart';
import 'package:flutter_tts/flutter_tts.dart';



void main(){

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:a(),
  )
  );
}
class a extends StatefulWidget {
  @override
  _aState createState() => _aState();
}

class _aState extends State<a> {
  //int x=0;
  List<String> langs=["english","arabic","french","deutch","spanish"];
  String sellang ="arabic";
  String ss;
  String temp;
  var tran=GoogleTranslator();
  TextEditingController q=TextEditingController();
  final FlutterTts flutterTts =FlutterTts();
  String x="Enter Text";
  String L="عربي";
  bool show=true;
  @override
  Widget build(BuildContext context) {
    Future _speak(String text) async{
      var result = await flutterTts.speak(text);
    }
    Size s =MediaQuery.of(context).size;
    double h=s.height,w=s.width;
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar:AppBar(
            backgroundColor: Colors.pinkAccent,

            title: Text("Translate",style:TextStyle(
              color:Colors.white,
              fontSize:h*0.05,
              fontWeight: FontWeight.bold,

            ) ,),

            actions: [


              Center(child: Icon(Icons.language,size: h*0.05,)),
              SizedBox(width: w*0.019,),

              Center(child: Icon(Icons.translate,size: 30,)),
              SizedBox(width: w*0.009,),



            ],
          ),

          body: Center(
            child: Container(
                //height: 200,
                width: 300,
                child: Column(
                  children: [
                       Container(
                         height: 100,
                       // width: 500,
                        child: Image(
                          image: NetworkImage('https://webstockreview.net/images/handwriting-clipart-animated-gif.gif'),
                        ),
                      ),
                 //   ),
                   // SizedBox(height: h*0.099,),

                    Expanded(
                     // flex:1,

                      child: TextField(
                        maxLines: 100,
                        cursorHeight: 30,
                        controller: q,
                        //  obscureText: show,
                        textAlign: L=="عربي"?TextAlign.right:TextAlign.left,
                        decoration: InputDecoration(

                        // focusColor: Colors.red,
                            hintText: "Text",
                            labelText: "Enter Text",
                            hintStyle: GoogleFonts.amiri(),
                            labelStyle: GoogleFonts.amiri(),
                        //    fillColor: Colors.red,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                            )

                        ),

                      ),
                    ),
                 //   Expanded(
                      Row(
                        children: [
                          InkWell(
                            child: Container(
                              height: 70,
                               width: 55,
                              child: Image(
                                image: NetworkImage('https://cdn.countryflags.com/thumbs/united-kingdom/flag-400.png'),
                              ),
                            ),
                            onTap: (){
                              tran.translate(q.text,to: 'en').then((value) {
                                x=value.text;
                                setState(() {

                                });
                              });
                            },
                          ),

                          SizedBox(width: w*0.04),

                          InkWell(
                            child: Container(
                              height: 30,
                              width: 50,
                              child: Image(
                                image: NetworkImage('https://cdn.countryflags.com/thumbs/saudi-arabia/flag-400.png'),
                              ),
                            ),
                            onTap: (){
                              tran.translate(q.text,to: 'ar').then((value) {
                                x=value.text;
                                setState(() {

                                });
                              });
                            },
                          ),

                          SizedBox(width: w*0.26),
                          Container(
                           // color: Colors.pinkAccent,
                            height: 30,
                            padding: EdgeInsets.all(5),
                            decoration:BoxDecoration(
                                border: Border.all(color: Colors.blueAccent,width: 2),
                                color: Colors.pinkAccent,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: DropdownButton(
                            hint: Text("a"),
                              dropdownColor: Colors.pinkAccent,
                            //  style: TextStyle(color: Colors.blue),
                              items: langs.map((lang){
                                return DropdownMenuItem(value: lang ,child: Text(lang));
                              }).toList(),

                              onChanged: (it){
                                ss=sellang.substring(0,2);
                                tran.translate(q.text,to: ss).then((value) {
                                  x=value.text;
                                  setState(() {
                                    sellang=it;

                                  });
                                  ss="";
                                // temp=value.text;
                                },);},

                              value: sellang,

                            ),
                          )



                        ],
                      ),
                 //   ),
                   Expanded(
                     child: Container(
                       width: 500,
                        child: Text(x),
                       decoration:BoxDecoration(
                           border: Border.all(color: Colors.blueAccent,width: 2),
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(10)
                       ),
                     ),
                   ),
                    InkWell(
                      child: Icon(Icons.volume_up,size: h*0.05,color: Colors.pinkAccent,),
                      onTap: () => _speak(x),
                    )
                  ],
                )
            ),
          ),

      ),
    );

  }
}

