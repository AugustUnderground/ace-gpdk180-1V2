# ace-gpdk180-1V8

## Introduction

The circuits in this repository are backends for
[AC²E](https://github.com/matthschw/ace) in Cadence GPDK 180nm (1.8V).

## Installation

```
$ git clone  https://github.com/augustunderground/ace-gpdk180-1V8.git
```

After cloning make sure to adjust the `pdk` symlink to suit your system.

## Circuits

- [X] [op1](https://raw.githubusercontent.com/matthschw/ace/main/figures/op1.png) 
- [X] [op2](https://raw.githubusercontent.com/matthschw/ace/main/figures/op2.png) 
- [X] [op3](https://raw.githubusercontent.com/matthschw/ace/main/figures/op3.png) 
- [X] [op4](https://raw.githubusercontent.com/matthschw/ace/main/figures/op4.png) 
- [X] [op5](https://raw.githubusercontent.com/matthschw/ace/main/figures/op5.png) 
- [X] [op6](https://raw.githubusercontent.com/matthschw/ace/main/figures/op6.png) 
- [ ] [op7](https://raw.githubusercontent.com/matthschw/ace/main/figures/op7.png) 
- [X] [op8](https://raw.githubusercontent.com/matthschw/ace/main/figures/op8.png) 
- [X] [op9](https://raw.githubusercontent.com/matthschw/ace/main/figures/op9.png) 
- [ ] [op10](https://raw.githubusercontent.com/matthschw/ace/main/figures/op10.png) 
- [X] [nand4](https://raw.githubusercontent.com/matthschw/ace/main/figures/nand4.png) 
- [X] [st1](https://raw.githubusercontent.com/matthschw/ace/main/figures/st1.png) 

## Device Characterization

For characterizing the `src/char.pl` script may be used:

```
$ perl ./src/char.pl [--nmos | --pmos]
```

This will use the netlists in `./chr` to characterize the primitive devices in
GPDK-180. If no arguments are given, both NMOS and PMOS devices will be
chracterized.

## Testing

Tests are implemented in perl:

```
$ perl ./src/test.pl
```

This should return no errors and fill the `./src/test/` directory with the
results. In case of errors, the corresponding `.log` files may give insight.

```
./src/test/
├── nand4.log
├── nand4.raw
├── op1.log
├── op1.raw
├── ...
├── st1.log
└── st1.raw
```
