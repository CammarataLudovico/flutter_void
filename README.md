# Project 3.1: Shopping Cart


## Project Description: 

- A basic e-commerce app with two screens: 
    - a Product screen and a Cart screen. 
    - Users can add items from the product list, obtaining a CartItem, and the cart icon in the AppBar (and the cart page itself) must automatically update to reflect the items in the cart.

## Core Technical Requirements:

- Use go_router to define two routes: /products and /cart
- Use a Provider to hold the static list of available products (hard-coded)
- Use a Notifier to manage the list of items in the cart (e.g., List<CartItem>)
- The Product screen calls methods on the Notifier to add items.
- The Cart screen (and AppBar) watch the NotifierProvider to display the number of items and the total price.

### Bonus: implement more functionalities

- On the Cart screen, add + and - buttons next to each item to call incrementItem() and decrementItem() methods on your Notifier
