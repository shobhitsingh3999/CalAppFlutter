import 'package:flutter/material.dart';


void main()=> runApp(const Shobhit());

class Shobhit extends StatefulWidget {
  const Shobhit({super.key});

  @override
  State<Shobhit> createState() => _ShobhitState();


  
}


class _ShobhitState extends State<Shobhit> {

String firstNum ='';
String secNum = '';
String opertaion='';
String output ='0';


  void doOperation(String buttonText){

    setState(() {
      
    if(buttonText=='C'){
       firstNum ='';
       secNum = '';
       opertaion='';
       output ='0';

    }

    else if(buttonText=='+'||buttonText=='-'||buttonText=='*'||buttonText=='/'||buttonText=='%'){
      opertaion=buttonText;
      output+=buttonText;
    }

    else if (buttonText=='='){
      double num1= double.parse(firstNum);
      double num2= double.parse(secNum);
      double result=0.00;

      if(opertaion=='+'){
        result=num1+num2;
      }
      if(opertaion=='-'){
        result=num1-num2;
      }
      if(opertaion=='*'){
        result=num1*num2;
      }
      if(opertaion=='/'){
        result=num1/num2;
      }
       if(opertaion=='%'){
        result=(num1/100)*num2;
      }

      output=result.toString();
      firstNum=result.toString();
      secNum="";
      opertaion='';

    }

    else{

      if (opertaion.isEmpty){
        
        firstNum+=buttonText;
      }
      else{
        secNum+=buttonText;
      }

      output+=buttonText;


    }
    });

  }
  
  
  
  Widget _bulidButton(String buttonText){
    return ElevatedButton(onPressed: ()=>doOperation(buttonText),style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ), backgroundColor: const Color.fromARGB(255, 16, 16, 15),
 
  ),child: Text(buttonText,style: const TextStyle(fontSize: 25,color: Color.fromARGB(255, 243, 161, 8),
)),);
  }
  
  @override
 Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'my app',

      
      home: Scaffold(
        appBar: AppBar(

          centerTitle: true,
          title:  Row(
            mainAxisAlignment:MainAxisAlignment.center,
          

            children:[
              Image.asset('assets/logo.png',scale: 12,),
              const SizedBox(width: 10,),
              const Text('CALCULATOR',style: TextStyle(color: Color.fromRGBO(4, 4, 4, 1))),
              

            ],),backgroundColor: const Color.fromARGB(255, 243, 161, 8) , 
              //title:  const Center( child:Text("CALCULATOR",style: TextStyle(color: Color.fromRGBO(4, 4, 4, 1)),),),backgroundColor: const Color.fromARGB(255, 243, 161, 8)
        ),backgroundColor: const Color.fromARGB(255, 255, 255, 255) ,

        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
           crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[

            Container(

                    padding: const EdgeInsets.all(20.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      output,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: const TextStyle(
                         fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                        
                      ),
                    ),
                  ),
          
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const SizedBox(width: 27,),
                Expanded(
                  child: _bulidButton("C"),
                  ),
                  const SizedBox(width: 27,),
                 
                  _bulidButton("%"),
                  const SizedBox(width: 27,),
                _bulidButton("+"),
                const SizedBox(width: 27,),

                

              ],
            ),


            Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _bulidButton("1"),
                _bulidButton("2"),
                _bulidButton("3"),
                _bulidButton("-"),

              ],
            ),
           
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _bulidButton("4"),
                _bulidButton("5"),
                _bulidButton("6"),
                _bulidButton("*"),

              ],
            ),
             
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _bulidButton("7"),
                _bulidButton("8"),
                _bulidButton("9"),
                _bulidButton("/"),

              ],
            ),

            Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                const SizedBox(width: 27,),
                Expanded(
                  child: _bulidButton("0"),
                  ),
                  const SizedBox(width: 27,),
                 
                  _bulidButton("."),
                  const SizedBox(width: 27,),
                _bulidButton("="),
                const SizedBox(width: 27,),

              ],
            ),

           const SizedBox(height: 30,)
          ],

        ),
        
        
        
        ),

      );
    
  }
  
 
}