# AsyncButton

This is a convenience type for encapsulating asynchronous logic in a SwiftUI `Button`. The initial base of this code was taken from John Sundell's article here: <https://swiftbysundell.com/articles/building-an-async-swiftui-button/>. This included the main idea and structure of `AsyncButton`. I restuctured it in various ways (i.e. using `OptionSet` for `ActionOptions`, backporting to iOS 13, using the `.task` modifier instead of a nested `Task`, the extra convenience initializers, etc.).
