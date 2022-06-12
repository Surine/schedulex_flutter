/// 课程

class CourseWrapper {
  // 课程名
  String? name;

  // 上课地点
  String? position;

  // 教师
  String? teacher;

  // 周几上课，取值1-7
  int day = 1;

  // 第几节开始 取值1 - x
  int sectionStart = 0;

  // 持续几节，注意是持续的节次，比如说两小节，这个值就为2
  int sectionContinue = 1;

  // 哪几周上课，如[1,3,4,6,7,8]表示1，3，4，6，7，8周上课
  List<int> week = [];
}
