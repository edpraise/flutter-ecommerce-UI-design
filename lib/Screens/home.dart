import 'package:flutter/material.dart';
import 'package:ondelivery_app/Screens/shop.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  AnimationController _scaleController;
  Animation<double> _scaleAnimation;

  bool hide= false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scaleController = AnimationController(
      vsync:this,
      duration:Duration(milliseconds:500),
    );

    _scaleAnimation =Tween<double>(
      begin: 1.0,
      end: 30.0
    ).animate(_scaleController)..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        Navigator.push(context, PageTransition(child:Shop(), type: PageTransitionType.fade));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/home.jpg'),
            fit: BoxFit.cover
            )
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                colors:[
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.4),
                ]
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("ON DELIVERY", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20),
                  Text("Bringing you comfort with timelly delivery",  style: TextStyle(color: Colors.white, fontSize: 20),),
                  SizedBox(height:100),
                  InkWell(
                    onTap: (){
                      _scaleController.forward();
                      setState(() {
                        hide = true;
                      });
                    },
                    child: AnimatedBuilder(
                      animation: _scaleController,
                      builder: (context, child )=>Transform.scale(
                        scale:_scaleAnimation.value,
                        child: Container(
                        height:50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: hide == false ? Text("Start Shopping", style: TextStyle(fontWeight:FontWeight.bold,),): Container(),
                        ),
                      ),
                      ),
                       
                    ),
                  ),
                  SizedBox(height:30),
                   Container(
                    height:50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text("Register", style: TextStyle(fontWeight:FontWeight.bold, color: Colors.white),),
                    ),
                  ),
                  SizedBox(height: 30,)
                ],
              ),
            )
          ),
        ),
      )
      
    );
  }
}