# Python Regex Challenges

## Challenge 1
```
def is_valid_email(email: str) -> bool:
    """
    Return True if email is valid, else False.

    Requirements

    - One @

    - Username: letters, numbers, ., _

    - Domain: letters only

    Valid: john_doe@gmail.com OR a.b@company.io
    Invalid: @google.com OR user@.com OR user@gmail
    """

```

💡 Hint: ^[...]$ matters more than people think.

## Challenge 2
```
def extract_phone_numbers(text: str) -> list[str]:
    """
    Extract all phone numbers from text.

    Supported Formats:
    123-456-7890
    (123) 456-7890
    1234567890

    Output Example:
    text = "Call me at 123-456-7890 or (555) 123-9999"
    # → ["123-456-7890", "(555) 123-9999"]
    """
```
💡 Hint: Non-capturing groups (?: ) help avoid messy output.

## Challenge 3
```
def mask_credit_cards(text: str) -> str:
    """
    Replace credit card numbers with **** **** **** 1234

    Example Input/Output:
    "My card is 4111 1111 1111 1234"
    "My card is **** **** **** 1234"
    """
```

💡 Hint: Lookahead keeps digits without consuming them.

## Challenge 4
```
def is_strong_password(password: str) -> bool:
    """
    At least:
    - 8 chars
    - 1 uppercase
    - 1 lowercase
    - 1 digit
    - 1 special char
    """
```

💡 Hint: You can do this with one regex.

## Challenge 5
```
def parse_log(line: str) -> dict:
    """
    Return level, date, and message.

    Input:
    "[ERROR] 2024-10-15 Something failed"

    Output:
    {
        "level": "ERROR",
        "date": "2024-10-15",
        "message": "Something failed"
    }
    """
```
💡 Hint: (?P<name>...) is interview gold.

## Question - Why is this regex bad?
```
.*@.*\..*
```

<details>
<summary>Answers</summary>

- Overmatching
- False positives
- Lack of anchors
</details>