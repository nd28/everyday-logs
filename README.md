# everyday-logs

Personal daily log system with todo.txt-style task management.

> **Note**: Replace `nd28` with your GitHub username in the URLs above.

## Install

```bash
# Quick install (uses ~/.local/bin by default)
curl -sL https://raw.githubusercontent.com/nd28/everyday-logs/main/log > ~/.local/bin/log
chmod +x ~/.local/bin/log

# Add to PATH
echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc
alias log=~/.local/bin/log

# Bash completions (optional)
curl -sL https://raw.githubusercontent.com/nd28/everyday-logs/main/completions.bash >> ~/.bashrc
source ~/.bashrc
```

Or clone manually:
```bash
git clone https://github.com/nd28/everyday-logs.git ~/everyday-logs
export PATH="$PATH:$HOME/everyday-logs"
alias log="$HOME/everyday-logs/log"
```

## Setup

```bash
export PATH="$PATH:$HOME/everyday-logs"
alias log="$HOME/everyday-logs/log"
```

Install [fzf](https://github.com/junegunn/fzf) for interactive task selection:
```bash
# fzf is optional - falls back to numbered selection
brew install fzf  # or apt install fzf, pacman -S fzf, etc.
```

## Setup
```bash
# everyday-logs
export EVERYDAY_LOGS_DIR="$HOME/everyday-logs"
alias log="$HOME/everyday-logs/log"
```

## Usage

| Command | Description |
|---------|-------------|
| `log new` | Create today's log entry |
| `log today` | Open today's log |
| `log tasks` | Show todo and recent done tasks |
| `log add "Task"` | Add a task |
| `log edit` | Edit task interactively (fzf) |
| `log delete` | Delete task interactively (fzf) |
| `log complete` | Mark task done (fzf or number) |
| `log search` | Search logs (fzf or term) |
| `log week` | Show last 7 days summary |
| `log backup` | Commit changes to git |
| `log restore <commit>` | Restore from git |
| `log doctor` | Diagnose and quick tour |

## Files

- `YYYY-MM-DD.md` - Daily log
- `todo.txt` - Pending tasks
- `done.txt` - Completed tasks
