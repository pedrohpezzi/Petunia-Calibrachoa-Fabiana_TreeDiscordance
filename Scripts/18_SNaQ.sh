#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=3-00:00:00
#SBATCH --qos=long
#SBATCH --partition=amilan
#SBATCH --ntasks=10       #number of cpus to use
#SBATCH --job-name=SNAQ
#SBATCH --mail-user=pedrohenriquepezzi@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --mem=15gb
#SBATCH --output=/scratch/alpine/pepe8426/PFC/SNaQ/SNAQ_h1.%j.out

#Display the job context
echo Job: $SLURM_JOB_NAME with ID $SLURM_JOB_ID
echo Running on `hostname`
echo Job started at `date +"%T %a %d %b %Y"`
echo Directory is `pwd`
echo Using $SLURM_NTASKS processors across $SLURM_NNODES nodes

#Assign path variables
DIRECTORY=/scratch/alpine/pepe8426/PFC/SNaQ

#Load modules
module purge
module load julia

#Enter directory
cd $DIRECTORY

#run SNaQ

julia runSNaQ.jl 5

# Final time stamp
echo Job finished at `date +"%T %a %d %b %Y"`

