enum LoadingStatus {
  loading,
  success,
  failure;

  bool isLoading() {
    return this == LoadingStatus.loading;
  }

  bool isSuccess() {
    return this == LoadingStatus.success;
  }

  bool isFailure() {
    return this == LoadingStatus.failure;
  }
}
