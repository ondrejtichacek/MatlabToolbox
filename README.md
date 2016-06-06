# IoSR Matlab Toolbox

A general purpose Matlab toolbox containing functions and classes for: auditory modelling, signal processing, sound source separation, statistics, plotting, etc. See [Contents.m](https://github.com/IoSR-Surrey/Toolbox/blob/master/+iosr/Contents.m) for a full list of functions/classes.

## Installation

Simply add this folder to your Matlab search path.

## Usage

Use these functions as:

```
iosr.<folderName>.<functionName>(<args>)
```

Alternatively, use the `import` directive to add one or more namespaces, e.g.:

```
import iosr.auditory
import iosr.*
```

If using `import`, note that some function names may conflict with built-in Matlab function names (e.g. `quantile`). One method of resolving the conflict and shortening the function call is to create a handle to any functions with conflicting names, e.g.

```
qntl = @iosr.statistics.quantile;
```

Type

```
help iosr
```

for more information.