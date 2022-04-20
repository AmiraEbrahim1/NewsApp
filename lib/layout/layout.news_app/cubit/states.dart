abstract class NewsStates {}
class InitialStates extends NewsStates {}
class BottomNavBarStates extends NewsStates {}
class GetBusinessLoadingStates extends NewsStates {}
class GetBusinessSuccessStates extends NewsStates {}
class GetBusinessErrorStates extends NewsStates {
  final String error;//??/
GetBusinessErrorStates(this.error);//?/
}
class GetSportsLoadingStates extends NewsStates {}
class GetSportsSuccessStates extends NewsStates {}
class GetSportsErrorStates extends NewsStates {
  final String error;//??/
  GetSportsErrorStates(this.error);//?/
}
class GetScienceLoadingStates extends NewsStates {}
class GetScienceSuccessStates extends NewsStates {}
class GetScienceErrorStates extends NewsStates {
  final String error;//??/
  GetScienceErrorStates(this.error);//?/
}
class GetSettingLoadingStates extends NewsStates {}
class GetSettingSuccessStates extends NewsStates {}
class GetSettingErrorStates extends NewsStates {
  final String error;//??/
  GetSettingErrorStates(this.error);//?/
}
class ChangeModeState extends NewsStates {}