import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gooddeals/core/resources/api_data_state.dart';
import 'package:gooddeals/features/ShoppingItems/domain/usecases/items_usecase.dart';
import '../remote/remote_items_event.dart';
import '../remote/remote_items_state.dart';

class RemoteItemsBloc extends Bloc<RemoteItemsEvent, RemoteItemsState> {
  final GetItemsUsecase _getItemsUsecase;
  RemoteItemsBloc(this._getItemsUsecase) : super(const RemoteItemsLoading()) {
    on<GetItemsEvent>(onGetItems);
  }
  void onGetItems(GetItemsEvent event, Emitter<RemoteItemsState> emit) async {
    final datastate = await _getItemsUsecase();
    if (datastate is DataSuccess && datastate.data!.isNotEmpty) {
      emit(RemoteItemsDone(datastate.data!));
    } else if (datastate is DataFailed) {
      print(datastate.error!.message);
      emit(RemoteItemsError(datastate.error!));
    }
  }
}
