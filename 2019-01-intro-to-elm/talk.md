class: center, middle

### 👋

---

class: middle

* looks suspiciously like Haskell

--

* compiles to JavaScript

--

* targets the web

---

class: middle

## Why?

---

class: middle

* variable mutation: `const`, `Object.assign`

--

* declarative programming: `Array.reduce`

--

* types: `interface Dog { breed: string }`

--

* backend-frontend: `OpenAPI`, `GraphQL`

--

> There is nothing wrong with JavaScript

---

class: middle

* variable mutation: `const`, `Object.assign`

* declarative programming: `Array.reduce`

* types: `interface Dog { breed: string }`

* backend-frontend: `OpenAPI`, `GraphQL`

> Runtime error in a 50.000 LOC frontend..

---

class: middle

### Still..

--

* `Uncaught TypeError: getSomething is not a function`

--

* `Uncaught TypeError: Cannot read property 'something' of undefined`

---

class: middle

### Moralize responsible programming 💩

---

class: middle

### Guarantee correct programs 🎉

---

class: middle, hero

# Intro to Elm

### Frontends with guarantees

---

class: middle

## Peter

--

`Berlin`

--

`peterszerzo.com`

--

`twitter.com/peterszerzo`

--

`contiamo.com`

--

`nlx.ai`

---

class: middle

### `introelm.peterszerzo.com`

---

class: center, middle

![Elm website](media/elm-website.png)

---

class: middle

```elm
someNumber : Int
someNumber =
  5

double : Int -> Int
double no =
  2 * no

doubleTheNumber =
  double someNumber
```

---

class: middle

```js
function double(x) {
  // doSomethingReallyWeird()
  return 2 * x
}
```

```elm
double : Int -> Int
double no =
  2 * no
```

---

class: middle

```js
const arr = [ 1, 2, 3 ]

let sum = 0

for (i = 0; i < arr.length; i++) {
  // doSomethingReallyWeird()
  sum += arr[i]
}
```

---

class: middle

```js
[ 1, 2, 3 ].reduce((accumulator, current) => {
  // doSomethingReallyWeird()
  return current + accumulator
}, 0)
```

---

class: middle

```elm
List.foldl
  (\a b -> a + b)
  0
  [ 1, 2, 3 ]
```

---

class: middle

```elm
module Main exposing (main)

import Html exposing (div, text)
import Html.Attributes exposing (style)

main =
  div
    [ style "color" "red"
    ]
    [ text "Hello, World!"
    ]
```

---

class: middle

```jsx
<div style={{ color: "red" }}>
  "Hello, World!"
</div>
```

---

class: middle

## Live examples

--

* show some HTML (with cats)

--

* simple app

--

* dog photos 🐩🐶🐕

---

class: center, middle

![Monads and cats](media/monad-tutorial.jpg)

---

class: middle

## What if we can't write Elm

[Example](https://codesandbox.io/s/k5po8o1873)

---

class: middle

## Reading

--

* [guide.elm-lang.org](https://guide.elm-lang.org/)

--

* [Mostly Adequate Guide to FP](https://mostly-adequate.gitbooks.io/mostly-adequate-guide/)

--

* [LambdaCast](https://soundcloud.com/lambda-cast)

--

* [Learn you a Haskell for great good](http://learnyouahaskell.com/)

--

* [Elm-Conf](https://www.youtube.com/channel/UCOpGiN9AkczVjlpGDaBwQrQ)

---

class: center, middle

### 🐣
