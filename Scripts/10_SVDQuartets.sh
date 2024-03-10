#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=1-00:00:00
#SBATCH --partition=amilan
#SBATCH --ntasks=32 
#SBATCH --job-name=SVDQuartets
#SBATCH --mail-user=pedrohenriquepezzi@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --mem=3gb
#SBATCH --output=/scratch/alpine/pepe8426/PFC/SuperMatrix/SVDQuartets/SVDQ.%j.out

#Display the job context
echo Job: $SLURM_JOB_NAME with ID $SLURM_JOB_ID
echo Running on `hostname`
echo Job started at `date +"%T %a %d %b %Y"`
echo Directory is `pwd`
echo Using $SLURM_NTASKS processors across $SLURM_NNODES nodes

#Assign path variables
DIRECTORY=/scratch/alpine/pepe8426/PFC/SuperMatrix/SVDQuartets

#Load modules
module purge

#Enter directory
cd $DIRECTORY

#run SVDQuartets

/projects/pepe8426/software/paup4a168_ubuntu64 $DIRECTORY/SVDQ_input.nex -n

# Final time stamp
echo Job finished at `date +"%T %a %d %b %Y"`
