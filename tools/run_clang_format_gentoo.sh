# Run from repo root (Gentoo)
for f in $(find src/ -name '*.h' -or -name '*.cpp'); do clang-format -style=file -i $f; done
for f in $(find modules/ -name '*.h' -or -name '*.cpp'); do clang-format -style=file -i $f; done
