
abstract class HomePageRepository {

  Future< List<DateTime> > getStreak();

  Future< int > getCurrentProgress(int courseId);
}