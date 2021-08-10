import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../Api/chemist_login_repo.dart';
import '../Model/chemist_login_model.dart';


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
     
     // i was creating ChemistLoginFormChange() but i shared this and flex(Owner of Library) told this
     //i need to use state.copyWith  but i have multiple state so i cant select them directly
       yield ChemistLoginFormChange().copyWith(
          userName: event.email,
          password: event.password,
          rememberMe: event.rememberMeCheckBox,
        );
    
    } else if (event is ChemistLoginPressed) {
        yield ChemistLoginLoadingState();
        try {

          // here is my repo where i need to access the data from the form for the api auth

          ChemistLoginModel data = await chemistLoginRepo.loginChemist(
              email: ChemistLoginFormChange().userName, password: ChemistLoginFormChange().password);


          if (data.code == 200) {

            // returning the api response
            yield ChemistLoginSucessfulState(chemistLoginModel: data);
          } else {
            // returning the api response if auth is not successful
            yield ChemistLoginErrorState(error: data.message);
          
        }
        } catch (error) {
          print(error);
        }
      }
    }
  }

