vsim -gui work.tb_neuron_input_weights
add wave -position insertpoint sim:/tb_neuron_input_weights/X
add wave -position insertpoint sim:/tb_neuron_input_weights/W
add wave -position insertpoint sim:/tb_neuron_input_weights/WS
add wave -position insertpoint sim:/tb_neuron_input_weights/Z
add wave -position insertpoint sim:/tb_neuron_input_weights/status
run 500 us