# everyday-logs Command Reference

Personal daily log system with task management. Files stored in `${EVERYDAY_LOGS_DIR:-$HOME/everyday-logs}`.

## Files

- `YYYY-MM-DD.md` - Daily log entry
- `todo.txt` - Pending tasks (one per line)
- `done.txt` - Completed tasks (format: `x YYYY-MM-DD Task`)

## Commands

| Command | Usage | Description |
|---------|-------|-------------|
| `log init` | `log init` | Scaffold todo.txt and done.txt |
| `log new` | `log new` | Create today's log entry, opens in $EDITOR |
| `log today` | `log today` | Open today's log in editor |
| `log tasks` | `log tasks` | Show TODO list and last 5 done tasks |
| `log add` | `log add "Task"` | Append task to todo.txt |
| `log edit` | `log edit` | Edit task interactively via fzf |
| `log delete` | `log delete` | Delete task interactively via fzf |
| `log complete` | `log complete [N]` | Mark task N done; with fzf if no arg |
| `log search` | `log search [term]` | Search logs; interactive if no term |
| `log week` | `log week` | Show summary of last 7 days |
| `log backup` | `log backup` | Commit all changes to git |
| `log restore` | `log restore <commit>` | Restore files from git commit |
| `log doctor` | `log doctor` | Diagnose setup issues |
| `log help` | `log help` | Show help message |

## Interactive Features (fzf)

When fzf is installed, these commands become interactive:
- `log complete` (no arg) - fzf task picker
- `log edit` - fzf task picker, then edit inline
- `log delete` - fzf task picker
- `log search` (no arg) - fzf search across all logs

## Environment

- `EVERYDAY_LOGS_DIR` - Custom log directory
- `EDITOR` - Editor for `log new`/`log today` (default: nvim)

## Task Completion Format

Tasks moved from todo.txt to done.txt get prefix: `x YYYY-MM-DD `

Example: `x 2026-04-15 Fix login bug`

## Task File Format

Lines starting with `#` are comments. Empty lines are ignored.

## Daily Log Format

```markdown
# Log - YYYY-MM-DD

## Tasks
-

## Notes
-

## Research
-

## Reminders
-
```