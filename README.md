# AsyncButton

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fedonv%2FAsyncButton%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/edonv/AsyncButton)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fedonv%2FAsyncButton%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/edonv/AsyncButton)

This is a convenience type for encapsulating asynchronous logic in a SwiftUI `Button`. The initial base of this code was taken from John Sundell's article here: <https://swiftbysundell.com/articles/building-an-async-swiftui-button/>. This included the main idea and structure of `AsyncButton`. I restuctured it in various ways (i.e. using `OptionSet` for `ActionOptions`, backporting to iOS 13, using the `.task` modifier instead of a nested `Task`, the extra convenience initializers, etc.).

## To-Do's

- [ ] Create environment values (internal ones that are used by public modifiers) for more granular settings
    - [ ] Animation for changes to `isEnabled` and `isShowingPlaceholder`
    - [ ] Duration to wait before showing the placeholder view (`minAsyncDuration`), which is used just in case `action` is so fast, nothing is needed to be shown
    - [ ] ActionOptions
