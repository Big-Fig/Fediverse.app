class RestHttpError extends RestError {
  final int statusCode;
  final String raw;

  RestHttpError(this.statusCode, this.raw);
}

class RestExceptionError extends RestError {
  final Exception exception;

  RestExceptionError(this.exception);
}

class RestError {}
