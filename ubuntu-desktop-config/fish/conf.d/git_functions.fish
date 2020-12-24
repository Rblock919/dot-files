set gitFilePreview "git diff HEAD --color=always -- {-1}"

function addFiles
  if test (count $argv) -ne 0
    git add $argv
  end
end

function resetFiles
  if test (count $argv) -ne 0
    git reset $argv > /dev/null
  end
end

function showPreview
    # Create an array of untracked files in git
    set untrackedFiles (git ls-files --others --exclude-standard)

    addFiles $untrackedFiles

    # Pipe all changes on staged & unstaged changes, then sort by unique incase there is a file with both shaged & non-staged changes
    set files (git diff --cached --name-only & git diff --name-only)
    printf '%s\n' (echo $files | string split " ") | sort -u | fzf -m --ansi --preview "$gitFilePreview"

    resetFiles $untrackedFiles
end

# Nice Function for Git Diff -> fzf
function fd
    if git rev-parse --git-dir > /dev/null 2>&1
        if [ -d .git ]
            showPreview > /dev/null
        else
            set gitRepoDir (git rev-parse --git-dir | sed 's/.git//')
            pushd $gitRepoDir > /dev/null
            showPreview > /dev/null
            popd > /dev/null
        end
    else
        echo "Error: Not inside a git repository."
    end
end


function showTmuxPreview
    set gitAction $argv[1]
    # 0 -> adding
    # 1 -> checking out
    # 2 -> resetting

    if test $gitAction -eq 0
      set untrackedFiles (git ls-files --others --exclude-standard)
      addFiles $untrackedFiles
      set files (git diff --name-only & echo $untrackedFiles)
      set returnFile (printf '%s\n' (echo $files | string split " ") | fzf-tmux -m --ansi --preview "$gitFilePreview")
      resetFiles $untrackedFiles
    else if test $gitAction -eq 1
      set returnFile (git diff --name-only | fzf-tmux -m --ansi --preview "$gitFilePreview")
    else if test $gitAction -eq 2
      set returnFile (git diff --cached --name-only | fzf-tmux -m --ansi --preview "$gitFilePreview")
    end

    echo "$returnFile"
end

# Nice Function for Git Diff -> fzf -> Git Add
function gaf
    if git rev-parse --git-dir > /dev/null 2>&1
        if [ -d .git ]
            git add (showTmuxPreview 0)
        else
            set gitRepoDir (git rev-parse --git-dir | sed 's/.git//')
            pushd $gitRepoDir > /dev/null
            git add (showTmuxPreview 0)
            popd > /dev/null
        end
    else
        echo "Error: Not inside a git repository."
    end
end

# Nice Function for Git Diff -> fzf -> Git Checkout
function gcf
    if git rev-parse --git-dir > /dev/null 2>&1
        if [ -d .git ]
            git checkout (showTmuxPreview 1)
        else
            set gitRepoDir (git rev-parse --git-dir | sed 's/.git//')
            pushd $gitRepoDir > /dev/null
            git checkout (showTmuxPreview 1)
            popd > /dev/null
        end
    else
        echo "Error: Not inside a git repository."
    end
end

# Nice Function for Git Diff -> fzf -> Git Reset
function grf
    if git rev-parse --git-dir > /dev/null 2>&1
        if [ -d .git ]
            git reset (showTmuxPreview 2)
        else
            set gitRepoDir (git rev-parse --git-dir | sed 's/.git//')
            pushd $gitRepoDir > /dev/null
            git reset (showTmuxPreview 2)
            popd > /dev/null
        end
    else
        echo "Error: Not inside a git repository."
    end
end
