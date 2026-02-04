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