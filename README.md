# PngQaunt EPEL repository issue

#### Only affecting CentOS 7

The problem package can be found here [pngquant-2.12.5-1.el7.x86_64.rpm](https://centos.pkgs.org/7/epel-x86_64/pngquant-2.12.5-1.el7.x86_64.rpm.html).

On CentOS 7 using package `pngquant-2.12.5-1.el7.x86_64` with the following command produces a 2-color image. It should be a 256-color image.

##### Command

```bash
pngquant --output pngquant-output.png --speed 1 --force -v -- pngquant-input.png
```

##### Output

```bash
pngquant-input.png:
  read 2019KB file
  used embedded ICC profile to transform image to sRGB colorspace
  made histogram...44630 colors found
  selecting colors...3%
  selecting colors...7%
  selecting colors...11%
  selecting colors...14%
  selecting colors...18%
  selecting colors...22%
  selecting colors...25%
  selecting colors...48%
  selecting colors...70%
  selecting colors...92%
  selecting colors...100%
  moving colormap towards local minimum
  eliminated opaque tRNS-chunk entries...0 entries transparent
  mapped image to new colors...MSE=553.309 (Q=0)
  writing 2-color image as pngquant-output.png
Quantized 1 image.
```

##### Image Input:
![Input](examples/pngquant-input.png)

##### Image Output:
![Output](examples/pngquant-output.png)

##### Expected Output

```bash
pngquant-input.png:
  read 2019KB file
  used embedded ICC profile to transform image to sRGB colorspace
  made histogram...44630 colors found
  selecting colors...3%
  selecting colors...7%
  selecting colors...11%
  selecting colors...33%
  selecting colors...37%
  selecting colors...59%
  selecting colors...81%
  selecting colors...100%
  moving colormap towards local minimum
  eliminated opaque tRNS-chunk entries...0 entries transparent
  mapped image to new colors...MSE=1.740 (Q=94)
  writing 256-color image as pngquant-output.png
  copied 2KB of additional PNG metadata
Quantized 1 image.
```

------

## Setup

For any of the tests to work, you will need to build the local docker images, to build these run the relevant build script for your OS.

Linux

```bash
bash dockerfiles/build.sh
```

Windows

```batch
call dockerfiles/build.bat
```

------

## Tests

These tests use docker containers to automate tests on different OS versions with the latest package installed via the default repo.

Change OS version accordingly.

Linux

```bash
bash tests/test-centos-version.sh {VERSION}
```

Windows

```batch
call tests/test-centos-version.bat {VERSION}
```

#### Example

Test all OS versions

Linux

```bash
bash tests/test-centos-version.sh 6
bash tests/test-centos-version.sh 7
bash tests/test-centos-version.sh 8
```

Windows

```batch
call tests/test-centos-version.bat 6
call tests/test-centos-version.bat 7
call tests/test-centos-version.bat 8
```

#### Input/Output Storage

The input `pngquant-input.png` and output `pngquant-output.png` images can be found in the `tests/CentOS-{6-8}/data` folder. 

These are removed every time the test is run.

#### Custom Image

Currently, this pulls an image from GitHub.

You can change the code in `scripts/test-pngquant.sh` to use a different image.

------

## Builds

These builds use docker containers to compile PngQuant to replicate the failed and successful build process.

##### Failed

The build that replicates the issue can be found at `builds/failed`.

Linux

```bash
bash builds/failed/test.sh
```

Windows

```batch
call builds/failed/test.bat
```

##### Successful

The build that fixes the issue can be found at `build/successful`.

Linux

```bash
bash builds/successful/test.sh
```

Windows

```batch
call builds/successful/test.bat
```
