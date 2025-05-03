class TaskModel{
  String taskName;
  String taskDescription;
  bool isCompleted;
  TaskModel({required this.taskName, required this.taskDescription, this.isCompleted = false});
}