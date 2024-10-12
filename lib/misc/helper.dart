/// Returns a function which caches the result of the execution of [fn].
/// The returned function ensures that [fn] is executed only during the first call.
/// For all subsequent calls to the returned function, it returns the cached result directly.
ReturnType Function() onceFn<ReturnType>(ReturnType Function() fn) {
  dynamic result;
  bool isFirstTimeRun = true;

  return () {
    if (!isFirstTimeRun) {
      return result;
    }
    result = fn();
    isFirstTimeRun = false;
    return result;
  };
}
