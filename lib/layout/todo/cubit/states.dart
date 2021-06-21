abstract class TodoStates {}

class TodoInitialState extends TodoStates {}

class TodoChangeBottomBarState extends TodoStates {}

class TodoOpenDatabaseState extends TodoStates {}

class TodoGetTasksState extends TodoStates {}

class TodoUpdateTaskStatusState extends TodoStates {}

class TodoUpdateTaskState extends TodoStates {}

class TodoInsertTaskState extends TodoStates {}

class TodoDeleteTaskState extends TodoStates {}

class TodoBottomSheetState extends TodoStates {}

class TodoBottomSheetUpdateState extends TodoStates
{
  dynamic task;

  TodoBottomSheetUpdateState({this.task});
}