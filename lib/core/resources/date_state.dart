abstract class DateState {}

class DateSuccess<T> extends DateState {
  T data;
  DateSuccess(this.data);
}

class DateError extends DateState {
  String error;
  DateError(this.error);
}
