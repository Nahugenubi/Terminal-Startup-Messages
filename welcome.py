import random
import os

def rainbow_text(text):
    colors = [
        '\033[91m',  # Red
        '\033[93m',  # Yellow
        '\033[92m',  # Green
        '\033[96m',  # Cyan
        '\033[94m',  # Blue
        '\033[95m',  # Magenta
    ]
    reset = '\033[0m'
    result = ""
    for i, c in enumerate(text):
        result += colors[i % len(colors)] + c
    return result + reset

def main():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    messages_path = os.path.join(script_dir, "messages.txt")

    with open(messages_path, "r", encoding="utf-8") as f:
        messages = [line.strip() for line in f if line.strip()]

    msg = random.choice(messages)
    print(rainbow_text(msg))

if __name__ == "__main__":
    main()
