

import 'dart:ffi';

import 'package:flutter/material.dart';
class login extends StatelessWidget{
  var passcontrol = TextEditingController();
  var emailcontrol =TextEditingController();
  var formKey = GlobalKey<FormState>();

  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed:(){}, icon:Icon(Icons.facebook_rounded))
        ],
        leading: Icon(
          Icons.menu,
        ),
         title: Text(
           'Welcome to LOQMA SORY',
           style: TextStyle(
        
             fontSize: 18.0,

             ) ,
           ),
         ),
      
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children:
                [
                  Text(
                    'login',
                     style: TextStyle(
                       fontSize: 25.0,
                       fontWeight: FontWeight.bold,
                     ),


                  ),
                  SizedBox(
                          height: 20.0,
                  ) ,
                  TextFormField(
                    controller: emailcontrol,
                    keyboardType: TextInputType.emailAddress,
                     decoration: InputDecoration(
                       labelText: 'Username or Mobile phone ',
                       border:OutlineInputBorder(),
                       prefixIcon: Icon(
                         Icons.email,
                       ) ,


                     ),
                 onFieldSubmitted: (String value){
                      print(value);
                 },
                    onChanged: (value){
                      print(value);
                    },
                    validator: ( value){
                      if(value!.isEmpty)

                      {
                        return 'Email NOT FOund';
                      }

                    },


                  ),
                     SizedBox(
                       height: 10.0,
                     ),
                  TextFormField(
                    controller: passcontrol,
                      obscureText: true,
                    decoration:InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.password),
                       suffixIcon: IconButton(onPressed:(){},icon: Icon(Icons.remove_red_eye)),
                      border:OutlineInputBorder(),


                    ),

                  ),
                    SizedBox(
                      height: 10.0,
                    ) ,
                  Container(
                    width: double.infinity,
                    color: Colors.blue,

                    child: MaterialButton(
                      onPressed:(){
                        if(formKey.currentState!.validate()) {
                          print(emailcontrol.text);
                          print(passcontrol.text);
                        }
                      } ,
                         child: Text(
                           'Login'

                         ),
                    ),
                  ) ,
                  SizedBox(
                    height: 10.0,
                  ) ,
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                      Text(
                        'Don\'t have an acount ?'

                      ),
                       TextButton(onPressed:(){}, child: Text(
                         'Register Now '

                       ),),

                     ],
                   ) ,






                  SizedBox(
                    height: 10,
                  ) ,
                ],
              ),
            ),
          ),
        ),
      ),



    );
  }
}