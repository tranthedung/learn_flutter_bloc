import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlishBloc extends Bloc<WishlishEvent, WishlishState> {
  WishlishBloc() : super(WishlishInitial()) {
    on<WishlishEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
