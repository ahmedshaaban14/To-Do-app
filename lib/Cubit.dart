import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/ArchivedTaskScreen.dart';
import 'package:untitled/TaskStates.dart';

import 'DoneTaskScreen.dart';
import 'NewTaskScreen.dart';
import 'chashed_helper.dart';

class AppCubit extends Cubit<TaskStates>
{
AppCubit (): super(InitialTask());
static AppCubit get(context)=> BlocProvider.of(context);
int currentIndex = 0 ;
late Database DB ;
List<Map> newtask = [];
List<Map> donetask = [];
List<Map> archivedtask = [];
bool isBottomSheet = false;
IconData FAB = Icons.edit;
List<Widget> screen =
[
  NewTaskScreen(),
  DoneTaskScreen(),
  ArchivedTaskScreen(),

];
List<String> title =
[
  'New Task',
  'Done Taskes' ,
  'Archived Taskes',


];
void createDb() {
 openDatabase(
    'ToDo.db',
    version: 1,
    onCreate: (DB , version)
    {
      DB.execute('Create Table Taskes(id INTEGER PRIMARY KEY, title TEXT , date TEXT , time TEXT , status TEXT )').then((value) {
        print('Table crteated');
      },
      ).catchError((error){
        print('error in craeting table ${error.toString()}');
      });
    },
    onOpen: (DB){
      GetFromDB(DB);
    },
  ).then((value)
 {
   DB =value;
   emit(CreateDBState());
 });
}
void GetFromDB(DB)
{
  newtask=[];
  donetask=[];
  archivedtask =[];
emit(CreateDBLoadingState());
 DB.rawQuery('SELECT * FROM Taskes').then((value) {

   value.forEach((element) {
     if (element['status'] == 'new')
       {
         newtask.add(element);
       }
     else if (element['status'] == 'done')
       {
         donetask.add(element);
       }
     else if (element['status'] == 'archived')
     {
       archivedtask.add(element);
     }
   });
   emit(GetFromDBState());
 });

}
  InsrtToDb({
  required String title,
  required String date,
  required String time,

}) async
{
   await DB.transaction((txn)async{
    await txn.rawInsert('INSERT INTO Taskes(title, date, time, status) VALUES("$title", "$date", "$time", "new")').
    then((value)
    {
      print('$value Inserted');
      emit(InsertToDBState());
      GetFromDB(DB);

    }
    ).catchError((error){
      print('AN Error in Insertion');

    });
    return null;
  } );

}
void updateDataBase({
  required String statues,
  required int id ,
})

async{
  DB.rawUpdate(
      'UPDATE Taskes SET status = ? WHERE id = ?',
      ['$statues', id, ]
  ).then((value) {
    GetFromDB(DB);
    emit(UpdateDBState());
  });
}
void deletefromDataBase({

  required int id ,
})

async{
  DB.rawDelete(
      'DELETE FROM Taskes WHERE id = ?', [id]
  ).then((value) {
    GetFromDB(DB);
    emit(DeleteDBState());
  });
}
void changeIndex(int index){
  currentIndex =index;
  emit(NavBarChange());
}
void ChangeFAb({
  required bool IsShow,
  required IconData icon,
})

{
  isBottomSheet =IsShow;
  FAB = icon;
  emit(ButtomSheetChangeState());
}
bool isDark = false;

void changeAppMode({required bool fromShared}){
  if(fromShared != null){
    isDark = fromShared;
    emit(ChangeTheme());
  }
  else{
    isDark =! isDark;
    CashHelper.puTBoolean(key: 'isDark', value: isDark).then((value) {
      emit(ChangeTheme());
    });
  }
}

}