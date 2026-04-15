# everyday-logs

Personal daily log system with todo.txt-style task management.

## Setup

```bash
export PATH="$PATH:$HOME/everyday-logs"
alias log="$HOME/everyday-logs/log"
```

Or add to shell rc:
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
| `log complete 1` | Mark task as done |
| `log search <term>` | Search across all logs |
| `log week` | Show last 7 days summary |

## Files

- `YYYY-MM-DD.md` - Daily log
- `todo.txt` - Pending tasks
- `done.txt` - Completed tasks
