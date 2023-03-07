import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/BuildedItems.dart';
import 'package:untitled/Cubit.dart';
import 'package:untitled/TaskStates.dart';

import 'components.dart';

class NewTaskScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit , TaskStates>(
      listener: (context , state){},
      builder: (context,state){
        var tasks = AppCubit.get(context).newtask;
     return ConditionalBuilder(
       condition:tasks.length > 0 ,
       builder: (context)=>  ListView.separated(itemBuilder: (context , index)=>BuildedItems(tasks[index], context),
         separatorBuilder: (context ,index)=>Container(
           width: double.infinity,
           height: 1.0,
           color: Colors.grey,
         ),
         itemCount: tasks.length,
       ),
       fallback: (context)=>Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Icon(
               Icons.hourglass_empty_sharp,
               color: Colors.grey,
               size: 50.0,
             ),
             Text('No Taskes Yet',
             style:TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 30.0,
               color: Colors.blueGrey,
             ) ,
             )

           ],
         ),
       ),



     );
    },
    );
  }
}
