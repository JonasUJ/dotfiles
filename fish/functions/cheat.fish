function cheat
	if test -z "$argv"
		echo "Usage: cheat <commands...>"
		echo ""
		echo "Display command cheatsheets from cheat.sh"
	else
		for cmd in $argv
			curl -s "cheat.sh/$cmd"
		end | less -R
	end
end
