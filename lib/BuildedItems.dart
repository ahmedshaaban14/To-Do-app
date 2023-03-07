import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Cubit.dart';



  @override
  Widget BuildedItems(Map model , context) {
    return Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text(
                '${model['time']}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${model['title']}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  ),
                  Text('${model['date']} ',
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 15.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            IconButton(
                onPressed: (){
                  AppCubit.get(context).updateDataBase(statues: 'done', id: model['id']);
                },
                icon: Icon(
              Icons.check_box_rounded,
                  color: Colors.greenAccent,
            )),
            IconButton(
                onPressed: (){
                  AppCubit.get(context).updateDataBase(statues: 'archived', id: model['id']);

                },
                icon: Icon(
                  Icons.archive,
                  color: Colors.blueGrey,
                ))

          ],
        ),
      ),
      onDismissed: (dirction){
AppCubit.get(context).deletefromDataBase(id: model['id'],);
      },
    );
  }

