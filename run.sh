#!/bin/bash

# setup

# run
run_cmd="python main.py --network_type rnn --dataset ptb --controller_optim adam --controller_lr 0.00035 --shared_optim sgd --shared_lr 20.0 --entropy_coeff 0.0001"

nvidia-docker run -it --rm \
       shopetan_enas \
           ${run_cmd}
