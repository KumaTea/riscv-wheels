# riscv-wheels
Prebuilt Python wheels for RISC-V (mainly deps for popular packages)

[![Coverage](https://shields.io/badge/python-3.8%20%7C%203.9%20%7C%203.10%20%7C%203.11%20%7C%203.12-blue)](https://github.com/KumaTea/riscv-wheels/releases)

* See also: [PyPy Wheels](https://github.com/KumaTea/pypy-wheels)

## How to use

```bash
pip install <package> --prefer-binary --extra-index-url https://rv.kmtea.eu/simple
```

The `--prefer-binary` option is to ensure that
once the source updates, the binary will still be used.
You may dismiss it at your will.

An alternative way is to use the `--find-links` option,
which is not recommended because the size of the index is large:

```bash
pip install <package> --prefer-binary --find-links https://rv.kmtea.eu/wheels.html
```

## Notice

Currently, all wheels are built under
**Ubuntu 22.04 (Jammy)**,
which is the earliest version that provided
`buildpack-deps` images for RISC-V.

The `glibc` version of Ubuntu 22.04 is:
**2.35** (`manylinux_2_35_riscv64` in the future).

Before the Python Authority makes its `manylinux`able,
the wheels will end in `linux_riscv64.whl`.
