#!/usr/bin/gnuplot

# Set output format and options
set terminal pngcairo size 3840,2160 enhanced font "Helvetica,12"
set output "heroes_loss_plot.png"

# Set plot properties
set title "Hero Loss Counts"
set key off
set xlabel "Hero"
set ylabel "Loss Count"
set xtics rotate by -45
set style data histograms
set style histogram cluster gap 1
set style fill solid 1.0 border -1

# Load data and configure the plot
set datafile separator ","
set auto x

# Plot the data
plot "hero_losses.txt" using 2:xtic(1) title "Losses" lc rgb "blue"
