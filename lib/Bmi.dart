

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled/ResultScreen.dart';

class Bmi extends StatefulWidget{
  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  bool isMail = true;
  double height = 120;
  double weight = 20;
  int age = 10 ;
  @override
  Widget build(BuildContext context)

{
  return Scaffold(
    appBar: AppBar(
      title: Text(
        'BMI calculator'
      ),

    ),
    body:Column(
      children:[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
      children: [
            Expanded(
              child: GestureDetector(
                onTap:(){
                 setState(()
                 {
                   isMail =true;
                 }
                 );
                  
                }
                ,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10.0),
                    color:isMail? Colors.blue : Colors.grey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.male,
                        size: 70.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Male',
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child:GestureDetector(
                onTap: (){
                 setState(()
                 {
                   isMail= false;
                 }
                 );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10.0),
                    color:!isMail ? Colors.blue: Colors.grey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.female,
                        size: 70.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('female',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                      ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ],



            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Height',
                  style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),

                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                    Text('${height.round()}',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w400
                    ),
                    ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('CM',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                      ),

                    ],
                  ),
                  Slider(value:height,
                         max: 280,
                          min:80,


                      onChanged:(value){
                    setState(()
                    {
                      height=value;
                    }
                    );
                    print(value.round());
                      } )
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey,

              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
horizontal: 10.0
),
            child: Row(
              children:[
                Expanded(
                  child: Container(

                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Weight',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,

                        ),),
                        Text('${weight.round()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        FloatingActionButton(onPressed: (){
                          setState(()
                          {
                            weight-- ;
                          });

                        },
                          child: Icon(Icons.remove),

                        ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(onPressed: (){
                              setState(()
                              {
                                weight++ ;
                              });
                            },
                              child: Icon(Icons.add),

                            ),

                              ],

                          ),


                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Container(

                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Age',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,

                          ),),
                        Text('${age}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(onPressed: (){
                              setState(()
                              {
                                age-- ;
                              });
                            },
                              child: Icon(Icons.remove),

                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(onPressed: (){
                              setState(()
                              {
                                age++ ;
                              });
                            },
                              child: Icon(Icons.add),

                            ),

                          ],

                        ),


                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
horizontal: 10.0
),
          child: Container(
            width: double.infinity,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blue,
            ),
            child: MaterialButton(onPressed: (){
              double result = weight/ pow(height/100, 2);

              print(result.round());

              Navigator.push(context,
                MaterialPageRoute(builder: (context)=>ResultScreen(
                  age: age,
                  result: result.round(),
                  ismail: isMail,
                ) ,
              ),
              );


            },
            child:Text('Calculate',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            ) ,),
          ),
        ),

      ]
    ) ,
  );
}
}