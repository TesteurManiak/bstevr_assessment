# chat_screen

<p float="left">
<img src="https://raw.githubusercontent.com/TesteurManiak/bstevr_assessment/main/chat_screen/screenshots/1.png" height="400"/>
<img src="https://raw.githubusercontent.com/TesteurManiak/bstevr_assessment/main/chat_screen/screenshots/2.png" height="400"/>
<img src="https://raw.githubusercontent.com/TesteurManiak/bstevr_assessment/main/chat_screen/screenshots/3.png" height="400"/>
<img src="https://raw.githubusercontent.com/TesteurManiak/bstevr_assessment/main/chat_screen/screenshots/4.png" height="400"/>
</p>

## Instructions

* Create a Chat screen prototype based on the above mock-ups. (Stay as true to the design as possible. Use your own images if needed.)
* Include the following key features:
    - When scrolling up/down in the messages area, the horizontal carousel should shrink/expand in relation to the drag.
    - When dragging is stopped, and the carousel reaches its smallest size, it should “lock” to the small size and not expand again on the next scroll gesture.
    - As the carousel shrinks/grows, the items within it should transition to their new visual layout.
    - Once the items in the carousel are shrunk (and dragging is still taking place) the tab bar and the “Members” subtitle should swipe up and fade out, while the “Family” title should shrink in size.
    - Swiping down on a shrunk carousel should expand it back to its maximum size.
    - When the input field receives focus, the header should snap to its new position.
    - Typing multiple lines of text should cause the input field to expand in size (up to 6 lines) and provide scrolling as needed.
    - Tapping outside of the input field should cause the keyboard to hide and for the header to snap to its shrunken state. (Regardless of the state it was in before.)
    - Submitting the text should add it as a new message in the messages view.
    - Tapping the PLUS button on the footer should add a new message to the messages view from a random user with random content. (It should also move the “Unread Messages” indicator to the correct location.)
