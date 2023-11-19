# riscv-wheels
Prebuilt RISC-V wheels (mainly deps for popular packages)

[![Coverage](https://shields.io/badge/python-3.8%20%7C%203.9%20%7C%203.10%20%7C%203.11%20%7C%203.12-blue)](https://github.com/KumaTea/riscv-wheels/releases)

## How to use

```bash
pip install <package> --prefer-binary --extra-index-url https://riscv.kmtea.eu/simple
```

The `--prefer-binary` option is to ensure that
once the source updates, the binary will still be used.
You may dismiss it at your will.

An alternative way is to use the `--find-links` option,
which is not recommended because the size of the index is large:

```bash
pip install <package> --prefer-binary --find-links https://riscv.kmtea.eu/wheels.html
```
