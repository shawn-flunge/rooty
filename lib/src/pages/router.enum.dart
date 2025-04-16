


enum Routes {
  home('/home', 'home'),
  courses('/courses', 'courses'),
  setting('/setting', 'setting'),
  login('/login', 'login'),
  course('/course', 'course'),
  lesson('/lesson', 'lesson');

  final String path;
  final String name;

  const Routes(this.path, this.name);

}