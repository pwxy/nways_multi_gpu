#!/bin/bash

# a line that starts with a pound sign is treated as a comment

nsys_output_dir=output_nsys
if [[ -d "${nsys_output_dir}" ]]; then
	rm -rf ${nsys_output_dir}
fi
mkdir ${nsys_output_dir}

#srun -N 1 -n 2 --ntasks-per-node=2 --gpus-per-node=4 ./select_gpu_device nsys profile --mpi-impl=mpich --trace=mpi,cuda,nvtx --force-overwrite true -o ${nsys_output_dir}/jacobi_memcpy_mpi_report_rank%q{SLURM_PROCID} ./jacobi_cuda_aware_mpi -nx 4096 -ny 16384 -skip_single_gpu

srun -N 1 -n 4 --ntasks-per-node=4 --gpus-per-node=4 ./select_gpu_device nsys profile --mpi-impl=mpich --trace=mpi,cuda,nvtx --force-overwrite true -o ${nsys_output_dir}/jacobi_memcpy_mpi_report_rank%q{SLURM_PROCID} ./jacobi_cuda_aware_mpi -nx 8192 -ny 16384 -skip_single_gpu

#srun -N 2 -n 8 --ntasks-per-node=4 --gpus-per-node=4 ./select_gpu_device nsys profile --mpi-impl=mpich --trace=mpi,cuda,nvtx --force-overwrite true -o ${nsys_output_dir}/jacobi_memcpy_mpi_report_rank%q{SLURM_PROCID} ./jacobi_cuda_aware_mpi -nx 16384 -ny 16384 -skip_single_gpu
