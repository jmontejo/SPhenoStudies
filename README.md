# SPheno studies

This is a package dedicated to running scans of SUSY points within SPheno+SARAH

### Install the code

Run `source install.sh` to get SPheno and compile it. The compilation is extremely slow (~2 hours).
By default it only compiles the model `MSSMTriRpV` which contains the trilinear RPV couplings. If other
models or couplings are needed simply adjust the -DMODELS

### Setup 

Simply `source setup.sh` before running

## Running scans

The main executable is `generate-scans.py` which can generate individual points or ranges. All points are stored
and it will skip points that have already been run previously.

A model has to be specified, and outputs of different models can not be combined or mixed
```
./generate-scan.py --model MSSMTriRpV
```

The input is a plain text LesHouches file (see [example](templates/LesHouches.in.template)) where any number of parameters
are not defined but have instead a text field that will be replaced by the actual value:
```
Block EXTPAR        # Input parameters
    1 M1TEMPLATE    # M1input
    2 5000          # M2input
    3 5000          # M3input
    ...
Block MSU2IN    # right-handed up squarks 
    3 3   MSTOPSQUARED      # mu2(3,3)
    ...
```

The same text can be used for multiple parameters if they all should receive the same value
```
Block MSD2IN    #  
    1 1   DECOUPLEDSQUARED  # md2(1,1)
    1 2   0.0               # md2(1,2)
    1 3   0.0               # md2(1,3)
    2 1   0.0               # md2(2,1)
    2 2   DECOUPLEDSQUARED  # md2(2,2)
    2 3   0.0               # md2(2,3)
    3 1   0.0               # md2(3,1)
    3 2   0.0               # md2(3,2)
    3 3   DECOUPLEDSQUARED  # md2(3,3)
```

The values to be replaced can be defined via command-line using any number of key=value assignments, and/or read out from a json file.
In case the same key is defined in both the command-line argument has preference, this allows to override file values.
```
./generate-scan.py --model MSSMTriRpV --input templates/LesHouches.in.template --values DECOUPLEDSQUARED=9e6 M1TEMPLATE=200 --values-file templates/UDD_MFV.json
```

The outputs are individual folders for each point, with a simple consecutive numbering scheme. In the previous example the output is one single folder since all inputs are fixed

### Scanning variables

Ranges of values can be set to run scans, both from command-line or from a file, the range can be any valid python expression:
```
./generate-scan.py ... --ranges 'TANBETA=[2,5,20,65]' 'M1TEMPLATE=range(200,600,100)' 'UDDTEMPLATE323=[pow(10,-i) for i in range(5)]'
```

Notice the above expression will generate a scan in 3 dimension, which might take very long to run.

### Target variables

All the variables defined in the input are defined at the level of the SUSY lagrangian. 
Sometimes it is required to study how an input affects some properties of a particle, however the mass of the particle also depends on the input.
For example, the branching ratio of a stop to b+s will depend on the UDD lambda''323 coupling, however the mass of the stop will also be affected via
loop effects involving the UDD coupling and sbottom/s-strange masses. Instead of fixing the input, the input can be varied until a target output is obtained.
The format is "input_parameter:output=target_value". The format and conventions for the output observables are defined in the [plotting](#plotting) section.
```
./generate-scan.py ... --target MSTOPSQUARED:1000002_mass=1000 --ranges 'UDDTEMPLATE323=[log10(-i) for i in range(5)]'
```

A scan of MSTOPSQUARED will be performed until a stop mass of 1000 GeV is achieved (notice that in RPV models all squarks mix, so 1000002 is the lightest up-type squark regardless of the generation).
Targets and ranges can be combined as shown above. For every UDD coupling, the mu2(3,3) parameter will be varied until the right output is achieved.
The input variable is scanned with a granularity of 10 GeV (or 100 GeV if it contains SQUARED in the name). This achieves a precision of at least 10 GeV for observables with a tree-level dependence, and much better than this if the input is a mass squared or enters via loops.

## Plotting

The outputs of the scans can used to plot any combination of input and output observables. The input is a folder with all the scans, essentially the output of the generate-scans.py script.
Any number of constraints can be applied, either on input or outputs. A mapping of input variables to their corresponding parameter in the SPheno output is defined in [inputs.py](python/inputs.py), and can be extended as needed.
Output variables are particle properties (other outputs that SPheno provides such as flavour observables are not available yet) and are identified as `pdgid_observable`, for example `1000002_mass`.
The observables defined are mass, width, ctau, lifetime, and BR.
```
./plot.py  -i outputs_MSSMTriRpV -o plots -c tanbeta=10 --plots stop_mass_vs_mtR
```
An extension can be used with `pdgid1_pdgid2_observable`, which computes observable(pdgid1)-observable(pdgid2), for example to plot the mass splitting.

The plots that can be produced are defined in [plots.py](python/plots.py). Also 2D plots can be defined. Each plot defines a set of variables that are allowed to vary. Even if they are specified as a constraint from command-line they will be allowed to vary. If only one variable is allowed to vary simple graph outputs are produced, if several are allowed then the output is a scatter plot.

## Full example

See [example.sh](example.sh) for a self-contained example running several scans and plots
