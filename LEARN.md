# Learning from everyday-logs

A beginner-friendly guide to bash scripting techniques used in this project.

## 1. Safe Script Header

```bash
#!/usr/bin/env bash
set -euo pipefail
```

- `set -e`: Exit on error
- `set -u`: Exit on undefined variable
- `set -o pipefail`: Catch errors in pipes

Always use this pattern for robust scripts.

## 2. Default Variable Values

```bash
dir=${EVERYDAY_LOGS_DIR:-$HOME/everyday-logs}
${EDITOR:-nvim}
```

Syntax: `${VAR:-default}` — use `VAR` if set, otherwise `default`.

## 3. Here Documents

```bash
cat << 'EOF'
# Log - DATE
...
EOF
```

Quotes around `EOF` prevent variable expansion. Without quotes, `$date` would be substituted.

## 4. Checking Command Existence

```bash
if command -v fzf &>/dev/null; then
```

`command -v` is preferred over `which` (portable, faster).

## 5. Fixed String Matching with grep

```bash
grep -v -F -- "$task" "$todo_file"
```

- `-F`: Treat pattern as fixed string (not regex) — handles `/`, `*`, etc.
- `-v`: Invert match (remove lines)
- `--`: Stop option parsing (handles tasks starting with `-`)

## 6. Atomic File Updates

```bash
grep -v -F -- "$task" "$todo_file" > "$todo_file.tmp" && mv "$todo_file.tmp" "$todo_file"
```

Write to temp file first, then rename. Prevents corruption if script is interrupted.

## 7. Looping with Read

```bash
while IFS= read -r line; do
    echo "$line"
done < "$file"
```

- `IFS=`: Preserve leading/trailing whitespace
- `-r`: Don't interpret backslashes

## 8. Parameter Expansion in Case

```bash
case ${1:-help} in
    init) ...
    *) help ;;
esac
```

`:-help` provides default if `$1` is empty/unset.

## 9. Command Dispatch Pattern

```bash
case ${1:-help} in
    init) init ;;
    new) new ;;
    add) add "${2:-}" ;;
esac
```

Clean way to map subcommands to functions, passing arguments.

## 10. fzf Integration

```bash
task=$(grep -vE '^#|^$' "$todo_file" | fzf --prompt="Select> " --height=~50% --reverse)
```

- Pipe filtered data to fzf for interactive selection
- Capture selected value with `$()`

## 11. Filtering Display vs Actual Data

```bash
# Display (skip comments and empty lines)
grep -vE '^#|^$' "$todo_file" | cat -n

# Actual line numbers from original file
sed -n "${1}p" "$todo_file"
```

Important: Display numbering ≠ file line numbers when filtering.

## 12. Temporary File Pattern for Replacements

```bash
while IFS= read -r line; do
    if [[ "$line" == "$task" ]]; then
        echo "$new_task"
    else
        echo "$line"
    fi
done < "$todo_file" > "$todo_file.tmp" && mv "$todo_file.tmp" "$todo_file"
```

Safe way to modify files with special characters.

## 13. Git Auto-Init Pattern

```bash
if [[ ! -d .git ]]; then
    git init
    git add .
    git commit -m "Initial commit"
fi
```

Lazily initialize a git repo on first backup.

## 14. File Header Guards

```bash
if [[ ! -f $todo_file ]]; then
    echo "# Todo.txt - edit manually..." > "$todo_file"
fi
```

Check before writing to avoid overwriting existing data.

## 15. Glob Patterns in Loops

```bash
for f in "$dir"/[0-9]*.md; do
    [[ -f $f ]] || continue
```

`[0-9]*` matches date-formatted files. The `[[ -f ]]` check handles no matches.
