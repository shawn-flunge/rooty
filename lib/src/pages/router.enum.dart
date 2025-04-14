


enum RootyRoutes {
  home('/home', 'home'),
  courses('/courses', 'courses'),
  setting('/setting', 'setting'),
  login('/login', 'login');

  final String path;
  final String name;

  const RootyRoutes(this.path, this.name);

}