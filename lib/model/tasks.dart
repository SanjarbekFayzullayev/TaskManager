class CategoryTask{
  String title;
  bool isSelected;

  String toString(){
    return 'MyTopic{title :$title ,isSelected: $isSelected}';
  }
  CategoryTask(this.title,{this.isSelected=false});
  static List<CategoryTask> topics=[
    CategoryTask('Design'),
    CategoryTask('Meeting'),
    CategoryTask('Coding'),
    CategoryTask('BDE'),
    CategoryTask('Testing'),
    CategoryTask('Quick call'),
  ];
}