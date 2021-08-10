part of 'chemist_login_bloc.dart';

abstract class ChemistLoginEvent extends Equatable {
  const ChemistLoginEvent();
  List<Object> get props => [];
}

class ChemistLoginFormChangedEvent extends ChemistLoginEvent {
  final String email;
  final String password;
  final bool rememberMeCheckBox;

  ChemistLoginFormChangedEvent(
      {this.email, this.password, this.rememberMeCheckBox});

  List<Object> get props => [email, password, rememberMeCheckBox];
}


class ChemistLoginPressed extends ChemistLoginEvent {}
