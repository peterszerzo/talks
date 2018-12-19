class: center, middle

### 👋

---

class: middle

* barely 6 years old

--

* pure functional

--

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

* `const`, `let`, `Object.freeze`

--

* `TypeScript`

--

* `GraphQL`

--

> There is nothing wrong with JavaScript

---

class: middle

* `const`, `let`, `Object.freeze`

* `TypeScript`

* `GraphQL`

> Runtime error in a 50000 LOC frontend..

---

class: middle

### Moralize responsible programming 💩

---

class: middle

### Guarantee a safe program 🎉

---

class: center middle, hero

# Intro to Elm

### Frontends with Guarantees

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

## Elm features

---

class: middle

### No `for` loops, yes recursion

---

### No FFI, yes ports

* no `FFI`, yes ports
* robust type system with insanely good error messages

---

## Examples

--

* simple app showing some HTML

--

* simple interactive app

--

* dog photo visualizer

---

class: middle

## What if we can't write Elm

--

* `Result Int <-> { type: "error", value: string } | { type: "success", value: T }`

--

* always decode data coming from servers: `https://github.com/contiamo/tucson`

---

class: center, middle

### 🐣
