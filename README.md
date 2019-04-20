# COD-2019

[![Build Status](https://travis-ci.com/iBug/COD-2019.svg?token=9jooK4Qfof8h4FFgpnEK&branch=master)](https://travis-ci.com/iBug/COD-2019) [![CircleCI](https://circleci.com/gh/iBug/COD-2019.svg?style=shield&circle-token=54b42325732cb2772c8f02651328e84af8f171cd)](https://circleci.com/gh/iBug/COD-2019)

Computer Organization and Design course of 2019

## Give me Verilog

Run `runMain Main` in SBT. By default, Verilog will be output to `target/` directory.

### I don't have Scala build environment

I'm smart and have set up [CircleCI][CircleCI] for this. Head to the latest build and download `verilog.tar.gz` from the arifacts.

## Testing

Run `test:runMain Main` in SBT to run default tests (usually only the latest lab).

Run `test:runMain TestAll` to run all tests.


  [CircleCI]: https://circleci.com/gh/iBug/COD-2019
