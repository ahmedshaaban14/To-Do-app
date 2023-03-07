import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/ArchivedTaskScreen.dart';
import 'package:untitled/Cubit.dart';
import 'package:untitled/DoneTaskScreen.dart';
import 'package:untitled/NewTaskScreen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:untitled/TaskStates.dart';
import 'package:untitled/themes.dart';
import 'components.dart';

class HomeS extends StatelessWidget

{


  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();

  var control = TextEditingController();
  var Timecontrol = TextEditingController();
  var datecontrol = TextEditingController();


  @override
  //void initState() {
    //super.initState();
    //createDb();
  //}
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context )=>AppCubit()..createDb(),
      child: BlocConsumer<AppCubit ,TaskStates>(
        listener: (BuildContext context , TaskStates state){
          if(state is InsertToDBState)
            {
              Navigator.pop(context);
            }
        },
        builder: (BuildContext context , TaskStates state)
        {
          AppCubit cub =AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar:AppBar(
              backgroundColor: Colors.teal,
             // leading: IconButton( onPressed: (){
              //   if(cub.IsDarkMode) {
              //     cub.ChangeMode(Isdark: true, icon: Icons.dark_mode,);
              //     themes.dark;
              //   }
              //   else
              //     cub.ChangeMode(Isdark: false, icon: Icons.light_mode,);
              //   themes.light;
              //
              // },
              //     icon: Icon(
              //       cub.DarkOrLight
              //     ),
              //
              // ),

              title: Text(
                cub.title[cub.currentIndex],),
            ) ,
            body:ConditionalBuilder(
              condition:state is! CreateDBLoadingState ,
              builder: (context)=>cub.screen[cub.currentIndex],
              fallback:(context)=> Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton:FloatingActionButton(
              backgroundColor: Colors.teal,
              onPressed:(){
              if(cub.isBottomSheet) {
                if (formkey.currentState!.validate()) {
                  cub.InsrtToDb(title: control.text, date: datecontrol.text, time: Timecontrol.text,);

                }
              }
              else {
                scaffoldKey.currentState!.showBottomSheet(
                      (context) => Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      color: Colors.teal,
                      child: Form(
                        key: formkey,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                cursorColor: Colors.blueGrey,
                                decoration:  InputDecoration(
                                  iconColor: Colors.blueGrey,
                                  fillColor: Colors.blueGrey,
                                  focusColor: Colors.blueGrey,
                                  hoverColor: Colors.blueGrey,
                                  prefixIcon:Icon( Icons.title,),
                                  label: Text('Title'),
                                ),
                                controller: control,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter title';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                cursorColor: Colors.blueGrey,
                                decoration:  InputDecoration(
                                  iconColor: Colors.blueGrey,
                                  fillColor: Colors.blueGrey,
                                  prefixIcon:Icon( Icons.watch,),
                                  label: Text('Time'),
                                ),
                                controller: Timecontrol,
                                onTap: (){
                                  showTimePicker(context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value)
                                  {
                                    Timecontrol.text =value!.format(context).toString();
                                  }
                                  );
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter time';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                            cursorColor: Colors.blueGrey,
                                decoration:  InputDecoration(
                                  prefixIcon:Icon( Icons.date_range_sharp,),
                                  label: Text('Date'),
                                ),
                                controller: datecontrol,
                                onTap: (){
                                  showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.parse('2030-01-01'),).then((value)
                                  {
                                    datecontrol.text = DateFormat.yMMMd().format(value!);
                                  }
                                  );
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Date';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ).closed.then((value) {
                  cub.ChangeFAb(IsShow: false, icon: Icons.edit);

                });
                cub.ChangeFAb(IsShow: true, icon: Icons.add);
              }

            } ,

              child:Icon( cub.FAB,),

            ),
            bottomNavigationBar: Container(
              color:Colors.teal ,
              child: BottomNavigationBar(
                backgroundColor: Colors.teal,
                selectedItemColor: Colors.grey,
                elevation: 20.0,
                currentIndex: AppCubit.get(context).currentIndex,
                onTap: (index){
                AppCubit.get(context).changeIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.menu_outlined,
                    ),
                    label: 'Taskes',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.check_box_rounded,
                    ),
                    label: 'Done',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.archive_outlined,
                    ),
                    label: 'Archived' ,
                  ),
                ],
              ),
            ),
          );
        },


      ),
    );

  }


}






