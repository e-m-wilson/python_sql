# Core Python Code Snippets & Patterns

A practical, opinionated cheat sheet of Python patterns you should be able to write from memory. Covers **Python basics, OOP, NumPy, pandas, matplotlib**, and foundational standard‑library tools.

---

## 🧠 Python Basics

### Variables & Types
```python
x = 10
pi = 3.14
name = "Ethan"
is_active = True
```

### Conditionals
```python
if x > 5:
    print("big")
elif x == 5:
    print("exact")
else:
    print("small")
```

### Loops
```python
for i in range(5):
    print(i)

while x > 0:
    x -= 1
```

### enumerate & zip
```python
for idx, value in enumerate(["a", "b", "c"]):
    print(idx, value)

for a, b in zip([1, 2], [3, 4]):
    print(a + b)
```

---

## 📦 Core Data Structures

### Lists
```python
nums = [1, 2, 3]
nums.append(4)
nums[1:3]
```

### Tuples
```python
point = (3, 4)
x, y = point
```

### Sets
```python
a = {1, 2, 3}
b = {3, 4, 5}
a & b      # intersection
a | b      # union
```

### Dictionaries
```python
user = {"id": 1, "name": "Alice"}

user["id"]
user.get("email", None)

for k, v in user.items():
    print(k, v)
```

---

## 🧩 Comprehensions

```python
squares = [x**2 for x in range(10)]

even_squares = [x**2 for x in range(10) if x % 2 == 0]

lookup = {x: x**2 for x in range(5)}

unique_lengths = {len(word) for word in ["hi", "hello", "yo"]}
```

---

## 🧪 Functions & Call Patterns

### Basic Function
```python
def add(a, b):
    return a + b
```

### Default Arguments
```python
def greet(name="world"):
    return f"Hello {name}"
```

### *args / **kwargs
```python
def log(*args, **kwargs):
    print(args)
    print(kwargs)
```

### Lambda
```python
sorted(nums, key=lambda x: abs(x))
```

---

## 📂 File I/O

```python
with open("data.txt", "r") as f:
    lines = f.readlines()

with open("out.txt", "w") as f:
    f.write("hello")
```

---

## 🧱 Python OOP

### Basic Class
```python
class User:
    def __init__(self, id: int, name: str):
        self.id = id
        self.name = name

    def greet(self):
        return f"Hi {self.name}"
```

### Inheritance
```python
class Admin(User):
    def has_access(self):
        return True
```

### Dataclasses
```python
from dataclasses import dataclass

@dataclass
class Point:
    x: float
    y: float
```

### Class / Static Methods
```python
class Config:
    ENV = "prod"

    @classmethod
    def from_env(cls, env):
        cls.ENV = env

    @staticmethod
    def is_valid(name):
        return len(name) > 3
```

---

## ⚠️ Exceptions & Errors

```python
try:
    x = int("abc")
except ValueError:
    x = 0
finally:
    print("done")
```
### Custom Exceptions
```python
class ValidationError(Exception):
    pass
```

---

## 🔢 NumPy Essentials

### Array Creation
```python
import numpy as np

a = np.array([1, 2, 3])
zeros = np.zeros((3, 3))
ones = np.ones(5)
```

### Indexing & Boolean Masks
```python
a[0]
a[1:]
a[a > 1]
```

### Broadcasting
```python
a + 10
a * np.array([1, 10, 100])
```

### Common Operations
```python
a.mean()
a.sum()
a.std()
```

### Shape Manipulation
```python
a.reshape((3, 1))
a.T
```

---

## 🐼 pandas Core Patterns

### Load & Inspect
```python
import pandas as pd

df = pd.read_csv("data.csv")

df.head()
df.info()
df.describe()
```

### Selection
```python
df["col"]
df[["a", "b"]]

df.loc[df["age"] > 30, "name"]
df.iloc[0:5, 1:3]
```

### Create / Modify Columns
```python
df["total"] = df["price"] * df["qty"]
```

### Groupby
```python
df.groupby("category")["sales"].sum()
```

### Vectorized String Ops
```python
df["name_len"] = df["name"].str.len()
```

### Merge / Join
```python
pd.merge(users, orders, on="user_id", how="left")
```

### Missing Data
```python
df.isna()
df.fillna(0)
df.dropna()
```

---

## 📊 matplotlib (Just Enough)

### Line Plot
```python
import matplotlib.pyplot as plt

plt.plot([1, 2, 3], [4, 5, 6])
plt.title("Simple Line")
plt.xlabel("x")
plt.ylabel("y")
plt.show()
```

### Histogram
```python
plt.hist(df["age"], bins=20)
plt.show()
```

### Scatter
```python
plt.scatter(df["x"], df["y"])
plt.show()
```

---

## 🧰 Foundational Standard‑Library Patterns

### defaultdict Counting
```python
from collections import defaultdict

counts = defaultdict(int)
for item in items:
    counts[item] += 1
```

### Counter
```python
from collections import Counter
Counter(items)
```

### Sorting Complex Data
```python
sorted(users, key=lambda u: u["age"])
```

### Dependency Injection (Backend Pattern)
```python
def service(repo):
    return repo.get_all()
```

---

## 🧠 Core Mental Models

- Python is **dynamically typed** and favors readability
- Prefer **vectorized operations** over loops in NumPy/pandas
- Use **immutability** where possible
- Explicit > clever
- Data transformations > step‑by‑step mutation

---

*Use this as a living document: add snippets you find yourself Googling twice.*

