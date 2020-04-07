import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widget/circle.dart';
import '../widget/input_text.dart';
import 'package:flutter/services.dart';

class Loginpage extends StatefulWidget {
 
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> 
{
  final _formkey=GlobalKey<FormState>();
 @override
void initState() { 
  super.initState();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
}

_submit(){

}
 
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());

        },
        child: Container(
        width: size.width,
        height:size.height ,
        child:Stack(
        children: <Widget>[
          Positioned(
           right:-size.width*0.22,
           top:-size.width*0.36,
           child:Circle(
             radius:size.width*0.45,
             colors:[
               Colors.pink,
               Colors.pinkAccent
             ]
           )
           
         ),

         Positioned(
           left:-size.width*0.15,
           top:-size.width*0.34,
           child:Circle(
             radius:size.width*0.35,
             colors:[
               Colors.orange,
               Colors.deepOrange

             ]
           )
           
         ),

         SingleChildScrollView(
           child:Container(
             width: size.width,
             height: size.height,
             child: SafeArea(
               child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,

               children: <Widget>[
               Column(
                 children: <Widget>[
              Container(
                 width:90,
                 height: 90 ,
                 margin: EdgeInsets.only(top:size.width*0.3),                
                 decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    //Sombreado 
                   boxShadow:[ 
                     BoxShadow(
                       color:Colors.black26,
                       blurRadius:25
                     )
                   ] 
                 ),

               ),
               SizedBox(height: 30),
               Text("Hello again.\n welcome back",
               textAlign:TextAlign.center,
               style: TextStyle(fontSize: 18,fontWeight:FontWeight.w300 ),
               )

                 ],
               ),
               Column(
                children: <Widget>[
                  ConstrainedBox(constraints: BoxConstraints(
                   maxWidth: 350,
                   minWidth: 350
                 ),
                  child:Form(
                    key: _formkey,
                    child:Column(
                    children: <Widget>[
                      InputText(label: "Email address",
                      validator:(String text){
                        if(text.contains("@")){
                          return null;
                        }
                        return "invalid Email";                
                      }                      
                      ),
                      
                          
                      InputText(label: "password",
                      validator: (String text){
                        if(text.isNotEmpty && text.length>5){
                          return null;
                        }
                        return "Constraseña incorrecta";
                      },
                      )
                    ],

                  ),  
                  )
                 ),
                 SizedBox(height: 40),
                 ConstrainedBox(constraints: BoxConstraints(
                   maxWidth: 350,
                   minWidth: 350
                 ),
                  child:  CupertinoButton(
                    padding: EdgeInsets.symmetric(vertical: 17),
                    color:Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(4),
                    onPressed:()=> _submit() ,
                    child: Text("Ingrese ",
                     style: TextStyle(fontSize: 20)),
                  ),
                 ),
                 SizedBox(height: 20),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Text("New to Friendly Desi? ",
                     style: TextStyle(fontSize: 16,color:Colors.black54)),
                     CupertinoButton(
                       child:Text("sign up", 
                       style: TextStyle(fontSize: 16,color: Colors.pinkAccent)) , 
                     onPressed: (){}
                     )
                   ],

                 ),
                //  SizedBox(height: size.height*0.08,)
                ],
               )

             ], 
           ),
            
             ),

             )     

         )
        ],
        )

      ),
       
      )
    );
  }
}



