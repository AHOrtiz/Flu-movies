import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:login/src/widget/circle.dart';
import 'package:login/src/widget/input_text.dart';

class RegistrarsePage extends StatefulWidget {
 
  @override
  _RegistrarsePageState createState() => _RegistrarsePageState();
}

class _RegistrarsePageState extends State<RegistrarsePage> 
{
  final _formkey=GlobalKey<FormState>();
  
 @override
void initState() { 
  super.initState();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
}

_submit(){
_formkey.currentState.validate();
}

String _validateEmail(String value){
Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
 RegExp regex   = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
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
               SizedBox(height: 10),
               Text(" Bienvenido",
               textAlign:TextAlign.center,
               style: TextStyle(fontSize: 15,fontWeight:FontWeight.w300 ),
               )

                 ],
               ),
               Column(
                children: <Widget>[
                  ConstrainedBox(constraints: BoxConstraints(
                   maxWidth: 300,
                   minWidth: 300
                 ),
                  child:Form(
                    key: _formkey,
                    child:Column(
                    children: <Widget>[
                      InputText(label: "Nombre Usuario ",
                      
                      validator: (String text){
                        if(RegExp(r'^[a-zA-Z0-9]+$').hasMatch(text)){
                          if(text.isNotEmpty && text.length>3){
                            if(text.length<10){
                              return null;
                            }

                          }
                         
                        }
                        return "Usuario incorrecto";
                      }      
                      ),
                      InputText(label: "Correo electronico",
                      inputType: TextInputType.emailAddress,
                      validator: _validateEmail,      
                      ),
                                            
                      InputText(label: "Contraseña",
                      isSecure:true ,
                      validator: (String text){                         
                        if(text.isNotEmpty && text.length>5){
                          if(text.length<10){
                            return null;
                         }
                          
                        }
                        return "Constraseña incorrecta";
                      },
                      )
                    ],

                  ),  
                  )
                 ),
                 
                 ConstrainedBox(constraints: BoxConstraints(
                   maxWidth: 350,
                   minWidth: 350
                 ),
                  child:  CupertinoButton(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    color:Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(4),
                    onPressed:()=> _submit() ,
                    child: Text("Registrate ",
                     style: TextStyle(fontSize: 15)),
                  ),
                 ),
                 
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Text("ya tienes cuenta ? ",
                     style: TextStyle(fontSize: 15,color:Colors.black54)),
                     CupertinoButton(
                       onPressed: ()=>Navigator.pushNamed(context, "/"),
                       child:Text("Inicia sesion", 
                       style: TextStyle(fontSize: 15,color: Colors.pinkAccent)) , 
                     
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

         ),
         Positioned(
           left:15,
           top: 5,
           child:SafeArea(
             child:CupertinoButton(
             padding: EdgeInsets.all(10),
             borderRadius: BorderRadius.circular(30),
             color: Colors.black12,              
             onPressed: ()=>Navigator.pop(context),
             child: Icon(Icons.arrow_back,
             color: Colors.white,),
             )
           )
           
           ),
        ],
        )

      ),
       
      )
    );
  }
}



