part of 'chemist_login_bloc.dart';

abstract class ChemistLoginState extends Equatable {
  const ChemistLoginState();
  @override
  List<Object> get props => [];
}

class ChemistLoginInitialState extends ChemistLoginState {}

class ChemistLoginLoadingState extends ChemistLoginState {}

class ChemistLoginFormChange extends ChemistLoginState {
  final String userName, password;
  final bool rememberMe;

  ChemistLoginFormChange(
      {this.password, this.userName, this.rememberMe = false});

  ChemistLoginFormChange copyWith({
    final String userName,
    final String password,
    final bool rememberMe,
  }) {
    return ChemistLoginFormChange(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }

  @override
  List<Object> get props => [password, userName, rememberMe];
}

class ChemistLoginSucessfulState extends ChemistLoginState {
  final ChemistLoginModel chemistLoginModel;

  ChemistLoginSucessfulState({this.chemistLoginModel});

  @override
  List<Object> get props => [chemistLoginModel];
}

class ChemistLoginErrorState extends ChemistLoginState {
  final error;

  ChemistLoginErrorState({this.error});

  @override
  List<Object> get props => [error];
}
