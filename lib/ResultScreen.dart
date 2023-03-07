import 'package:flutter/material.dart';

class ResultScreen  extends StatelessWidget {
    int result;
    bool ismail ;
    int age;
   ResultScreen({
     required this.result,
     required this.ismail,
     required this.age,
});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Container(

        color: Colors.grey,
        child: Center(
          child: Container(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Result is: $result',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
                ),
                Text('Gender:${ismail ? 'male' : 'female' }',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                Text('Age: $age',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(
                  height: 400.0,
                ),
                Text('Devoloped By : Ahmed Shaaban',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 10.0,
                  ),
                ),

              ],
            ),
          ),

        ),
      ),
    );
  }
}
