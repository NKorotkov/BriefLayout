# BriefLayout

**BriefLayout** is a very simple framework that leverages the power of Swift custom operators to ease the burden of writing autolayout code.
It's just a syntax sugar, that makes trivial code more "brief".

Let's look at example. Here's generic autolayout code:
```swift
NSLayoutConstraint.activate([
  myView.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: 10),
  myView.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -10),
  myView.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
])
```

And now with **BriefLayout**:

```swift
myView.left => superview.left + 10
myView.right => superview.right - 10
myView.centerY => superview.centerY
```

Looks much cleaner, right? There are frameworks that allow getting the same result with even less amount of code, probably a single line. But that was not the goal of **BriefLayout**

<a name="faq"></a>
## FAQ 

**Q: What if I need to keep a reference to an arbitrary constraint instance to change it later?**  
**A:** It's easy. The `=>` operator actually returns a newly created constraint, you just need to assign it.
```swift
let constraintRef = myView.left => superview.left + 10
```

## License
MIT License
