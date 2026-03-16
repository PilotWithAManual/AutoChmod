# AutoChmod

AutoChmod is a small terminal-based utility that helps you make shell scripts executable quickly and safely. It's designed to be used in a folder containing `.sh` files, and provides an interactive text menu so you can choose whether to:

- Make every `.sh` file in the current directory executable, or
- Choose a single file to make executable.

The tool is intentionally minimal and uses only standard bash features so it works on nearly any Linux/macOS system.

---

## 🚀 Getting Started

### 1) Make the script executable

From the directory containing `AutoChmod.sh`:

```bash
chmod +x AutoChmod.sh
```

### 2) Run the script

```bash
./AutoChmod.sh
```

> If you prefer running it from anywhere, you can move it into a folder in your `PATH`:
>
> ```bash
> sudo mv AutoChmod.sh /usr/local/bin/autochmod
> autochmod
> ```

---

## 🧭 What the UI Looks Like

When you start the script, it clears the screen and prints an ASCII banner along with a small menu.

Example output:

```
     _         _         ____ _                         _ 
    / \  _   _| |_ ___  / ___| |__  _ __ ___   ___   __| |
   / _ \| | | | __/ _ \| |   | '_ \| '_ ` _ \ / _ \ / _` |
  / ___ \ |_| | || (_) | |___| | | | | | | | | | (_) | (_| |
 /_/   \_\__,_|\__\___/ \____|_| |_|_| |_| |_|\___/ \__,_|

1) Make all .sh files executable
2) Choose a specific file
3) Exit

Select an option: 
```

---

## ✅ How It Works

### Option 1: Make all `.sh` files executable

When you choose this option, the script loops over every file ending with `.sh` in the current directory.
For each file it finds, it runs:

```bash
chmod +x <filename>
```

If a file is not actually a regular file (e.g., a directory), it is skipped.

### Option 2: Choose a specific file

When you choose this option, you are prompted to type a filename. If that file exists, the script runs:

```bash
chmod +x <your-file>
```

If the file does not exist, you’ll see an error message.

---

## 🛠 Customizing Behavior

If you want to change how AutoChmod works, edit the `AutoChmod.sh` script directly.

Key sections you can modify:

- **ASCII banner** (top of the file) — change it to your own branding.
- **Menu options** — the `options=(...)` array controls what appears in the menu.
- **Action logic** — the `case` statement handles each option.

---

## ✅ Compatibility

AutoChmod is intentionally written in plain bash with no external dependencies, so it works on:

- Linux (Ubuntu, Debian, Fedora, Arch, etc.)
- macOS

---

## 💬 Notes

- The script only adds execute permission (`chmod +x`); it does not modify ownership or other permissions.
- If you run it from a directory with many `.sh` files, it will make all of them executable.
- Use the `Exit` menu option or press `Ctrl+C` to quit.
