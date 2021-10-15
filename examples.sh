#### Generate points
# Run one point, set the tanbeta value to something different from what is the benchmark file
./generate-scan.py --input templates/LesHouches.in.template --values-file templates/benchmark_UDD323.json --values TANBETATEMPLATE=5
# Run a scan of 4 different tanbeta values, the second point will be skipped as it has run already in the previous example
./generate-scan.py --input templates/LesHouches.in.template --values-file templates/benchmark_UDD323.json --ranges TANBETATEMPLATE=[2,5,10,50]
# Run a scan of 4 different lambda''323 values (1, 0.1, 0.01, 0.001). For each value find the MSTOPSQUARED value that yields a stop mass of 1000 GeV
./generate-scan.py --input templates/LesHouches.in.template --values-file templates/benchmark_UDD323.json --target MSTOPSQUARED:1000002_mass=1000  --ranges 'UDDTEMPLATE323=[pow(10,-i) for i in range(4)]'
#### 27 points should have been produced at this point (might fluctuate depending on the precision used for the target)

#### Plots
# 1D plots with some constraints
./plot.py --input outputs_MSSMTriRpV -o plots -c udd323=0.1 tanbeta=10 --plots stop_mass_vs_mtR
./plot.py --input outputs_MSSMTriRpV -o plots -c 1000002_mass=1000 tanbeta=10 --plots stop_br_vs_udd323
# 1D plot, the udd323 constraint is ignored since it enters the x-axis
# the output is a scatter plot since the stop mass also depends on mtR, which is not fixed
./plot.py --input outputs_MSSMTriRpV -o plots -c udd323=0.1 tanbeta=10 --plots stop_mass_vs_udd323
# 2D plots, run multiple plots at once
./plot.py --input outputs_MSSMTriRpV -o plots -c udd323=0.1 tanbeta=10 --plots2D neutralino1_lifetime_vs_udd_vs_stopmass stop_mass_vs_mtR_vs_udd323
