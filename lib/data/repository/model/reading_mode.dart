enum ReadingMode {
  page,
  scroll;

  bool isPage() {
    return this == ReadingMode.page;
  }

  bool isScroll() {
    return this == ReadingMode.scroll;
  }
}
