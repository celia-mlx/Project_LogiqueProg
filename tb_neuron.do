vsim -gui work.tb_neuron
add wave -position insertpoint sim:/tb_neuron/X
add wave -position insertpoint sim:/tb_neuron/WS
add wave -position insertpoint sim:/tb_neuron/Z
add wave -position insertpoint sim:/tb_neuron/status
run 1800 us