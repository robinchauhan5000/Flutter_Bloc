import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ayuvani/data/repo/chemist_repo/chemist_login_repo.dart';
import 'package:flutter_ayuvani/models/chemist_models/chemist_login_model.dart';

part 'chemist_login_event.dart';
part 'chemist_login_state.dart';

class ChemistLoginBloc extends Bloc<ChemistLoginEvent, ChemistLoginState> {
  ChemistLoginBloc({this.chemistLoginRepo}) : super(ChemistLoginInitialState());

  final ChemistLoginRepo chemistLoginRepo;

  @override
  Stream<ChemistLoginState> mapEventToState(
    ChemistLoginEvent event,
  ) async* {
    if (event is ChemistLoginFormChangedEvent) {
      if (state is ChemistLoginInitialState) {
        yield ChemistLoginInitialState();
      } else if (state is ChemistLoginFormChange) {
        ChemistLoginFormChange chemistLoginFormChange =
            this.state as ChemistLoginFormChange;

        yield chemistLoginFormChange.copyWith(
          userName: event.email,
          password: event.password,
          rememberMe: event.rememberMeCheckBox,
        );
      }
    } else if (event is ChemistLoginPressed) {
      if (state is ChemistLoginLoadingState) {
        yield ChemistLoginLoadingState();
      }

      var form = this.state as ChemistLoginFormChange;

      if (state is ChemistLoginFormChange) {
        try {
          ChemistLoginModel data = await chemistLoginRepo.loginChemist(
              email: form.userName, password: form.password);
          if (data.code == 200) {
            yield ChemistLoginSucessfulState(chemistLoginModel: data);
          } else {
            yield ChemistLoginErrorState(error: data.message);
          }
        } catch (error) {
          print(error);
        }
      }
    }
  }
}
