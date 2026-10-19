#!/bin/bash

# a line that starts with a pound sign is treated as a comment

srun -N 1 -n 2 --ntasks-per-node=2 --gpus-per-node=4 ./select_gpu_device ./jacobi_cuda_aware_mpi -nx 4096 -ny 16384 -niter 5000

srun -N 1 -n 4 --ntasks-per-node=4 --gpus-per-node=4 ./select_gpu_device ./jacobi_cuda_aware_mpi -nx 8192 -ny 16384 -niter 5000

srun -N 2 -n 8 --ntasks-per-node=4 --gpus-per-node=4 ./select_gpu_device ./jacobi_cuda_aware_mpi -nx 16384 -ny 16384 -niter 5000
