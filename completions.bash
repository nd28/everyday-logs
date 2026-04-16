_log_completions() {
	local -a commands=(
		"init"
		"new"
		"today"
		"tasks"
		"add"
		"edit"
		"delete"
		"complete"
		"search"
		"week"
		"backup"
		"restore"
		"doctor"
		"help"
	)

	local cur=${COMP_WORDS[COMP_CWORD]}
	local prev=${COMP_WORDS[COMP_CWORD-1]}

	case $prev in
		add)
			compopt -o nospace
			COMPREPLY=()
			return
			;;
		complete|restore|search|edit|delete)
			COMPREPLY=()
			return
			;;
		*)
			;;
	esac

	completions=("${commands[@]}")
	COMPREPLY=($(compgen -W "${completions[*]}" -- "$cur"))
}

complete -F _log_completions log