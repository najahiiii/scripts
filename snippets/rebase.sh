#/bin/bash sh
echo "Rebasing llvm-project monorepo"
pushd $HOME/llvm-project
    git pull --rebase origin main
    git push private main -f
popd
