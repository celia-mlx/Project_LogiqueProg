vsim -gui work.tb2_neuron

add wave -position insertpoint sim:/tb2_neuron/X1
add wave -position insertpoint sim:/tb2_neuron/weight_array1
add wave -position insertpoint sim:/tb2_neuron/WS1
add wave -position insertpoint sim:/tb2_neuron/Z1
add wave -position insertpoint sim:/tb2_neuron/status1
add wave -position insertpoint sim:/tb2_neuron/X2
add wave -position insertpoint sim:/tb2_neuron/concatZ
add wave -position insertpoint sim:/tb2_neuron/weight_array2
add wave -position insertpoint sim:/tb2_neuron/WS2
add wave -position insertpoint sim:/tb2_neuron/Z2
add wave -position insertpoint sim:/tb2_neuron/status2

run 1500 us