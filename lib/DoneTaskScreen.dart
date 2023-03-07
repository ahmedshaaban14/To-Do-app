import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'BuildedItems.dart';
import 'Cubit.dart';
import 'TaskStates.dart';

class DoneTaskScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , TaskStates>(
      listener: (context , state){},
      builder: (context,state){
        var tasks = AppCubit.get(context).donetask;
        return ListView.separated(itemBuilder: (context , index)=>BuildedItems(tasks[index], context),
          separatorBuilder: (context ,index)=>Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.green,
          ),
          itemCount: tasks.length,
        );
      },
    );
  }
}