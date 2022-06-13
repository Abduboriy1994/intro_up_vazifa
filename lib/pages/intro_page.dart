import 'package:flutter/material.dart';
import 'package:intro_up_vazifa/home_page.dart';
import 'package:intro_up_vazifa/pages/utils/strings.dart';
class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  static const String id ="intro_page";

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  PageController _pageController =PageController();
  int  currentIndex =0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController=PageController(initialPage: 0);
  }

  @override
  void dispose() {
  _pageController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page){
              setState(() {
                currentIndex=page;
              });

            },
            children: [
              makePage(
                title: strings.StepOneTitle,
                  content: strings.StepOneContent,
                image: "assets/images/image_1.png",
              ),
              makePage(
                title: strings.StepTwoTitle,
                  content: strings.StepTwoContent,
                image: "assets/images/image_3.png",
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
          GestureDetector(
            onTap:(){
              Navigator.pushReplacementNamed(context, HomePage.id);
            } ,
          ),

          Container(
            margin: EdgeInsets.only(left: 320,bottom: 30),

         child: Text("Skip",style: TextStyle(color: Colors.red,fontSize: 18),),
          )
        ],
      )

    );

  }
  Widget makePage({title,content,image}) {
    return Container(
      padding: EdgeInsets.only(right: 50,left: 50,bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,style: TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Text(content,style: TextStyle(color: Colors.grey,fontSize: 20),textAlign: TextAlign.center,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(image),
          ),

        ],
      ),
    );
  }

  Widget indicaror(bool _isActive){
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      height: 6,
      width:  _isActive  ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(5)),
    );


  }

  List<Widget>_buildIndicator(){
    List<Widget>indicators=[];
    for(int i=0;i<3;i++){
      if (currentIndex==i){
        indicators.add(indicaror(true));
      }else{
        indicators.add(indicaror(false));
      }
    }
    return indicators;
  }
}
