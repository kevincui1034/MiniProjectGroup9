# Function to skip empty lines
isEmpty(s) = s eq "" ? 1 : 0

# Set output format and options
set terminal pngcairo size 3840,2160 enhanced font "Helvetica,12"
set output "output_plot.png"

# Set plot properties
set key outside
set xlabel "Hero"
set ylabel "Count"
set xtics rotate by -45
set style data histograms
set style histogram cluster gap 1

# Define the regions
regions = "US_West US_East China Russia Europe_West Europe_East South_America South_Korea South_Africa Chile Peru Southeast_Asia India Australia"

# Loop through regions and plot data
do for [region in regions] {
    input_file = region.".txt_herocounts.txt"
    output_file = region."_herocounts.png"

    # Plot the data
    plot input_file using 6:xticlabels(4) title "Count" lc rgb "blue"

    # Save the plot to a file
    set output output_file
    replot
    set output
    print "Plotted for ", region
}
