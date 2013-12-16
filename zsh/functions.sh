set_github_remote() { git remote set-url origin git@github.otbeach.com:onthebeach/"$1".git; }

translate_branch_name() { echo "$1" | tr / \;; }

git_root() { git rev-parse --show-toplevel; }

git_current_branch() { git branch | grep "*" | cut -c3-; }

app_name() { git_root | sed -e 's/\/current$//' -e 's/.*\///'; }

string_with_dots() { echo "$1...$2"; }

branches() { string_with_dots $(translate_branch_name $1) $(translate_branch_name $2); }

compare_branches() { /usr/bin/open -a "/Applications/Google Chrome.app" $(compare_url ${1-master} ${2-$(git_current_branch)}); }

compare_url() { echo "https://github.otbeach.com/onthebeach/$(app_name)/compare/$(branches $1 $2)"; }
