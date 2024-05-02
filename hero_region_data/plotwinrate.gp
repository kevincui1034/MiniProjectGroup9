#!/usr/bin/gnuplot

# Set output format and options
set terminal pngcairo size 3840,2160 enhanced font "Helvetica,12"
set output "heroes_win_rate_plot.png"

# Set plot properties
set title "Hero Win Rate"
set key off
set xlabel "Hero"
set ylabel "Win Rate"
set xtics rotate by -45
set style data histograms
set style histogram cluster gap 1
set style fill solid 1.0 border -1

# Load data and configure the plot
set datafile separator ","
set auto x

# Plot the data
plot "hero_win_rate.txt" using 2:xtic(1) title "Win Rate" lc rgb "blue"
