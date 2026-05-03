vsim -gui work.tb_neuron_sync
add wave -position insertpoint sim:/tb_neuron_sync/X
add wave -position insertpoint sim:/tb_neuron_sync/weight_array
add wave -position insertpoint sim:/tb_neuron_sync/WS
add wave -position insertpoint sim:/tb_neuron_sync/Z
add wave -position insertpoint sim:/tb_neuron_sync/CLOCK
add wave -position insertpoint sim:/tb_neuron_sync/status
run 130 us