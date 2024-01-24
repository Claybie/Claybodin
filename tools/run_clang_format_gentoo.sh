# Run from repo root
# TODO: Adapt for current Gentoo env (clang 15 and up)
for f in $(find src/ -name '*.h' -or -name '*.cpp'); do clang-format -style=file -i $f; done
for f in $(find modules/ -name '*.h' -or -name '*.cpp'); do clang-format -style=file -i $f; done
