# Adds the local "/bin" directory to the shell $PATH so any gem executable / binstub can be invoked without the "bin/" prefix.
export PATH="$PWD/bin:$PATH"
hash -r 2>/dev/null || true
