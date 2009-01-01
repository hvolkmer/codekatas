List reverse = method(
  reversed = list()
  self each(element, reversed = list(element) + reversed)
  reversed
)