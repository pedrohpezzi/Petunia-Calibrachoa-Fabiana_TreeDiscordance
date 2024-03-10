#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=3-0:00:00
#SBATCH --qos=long
#SBATCH --partition=amilan
#SBATCH --ntasks=12       #number of cpus to use
#SBATCH --job-name=PhyloNet
#SBATCH --mail-user=pedrohenriquepezzi@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --mem=2gb
#SBATCH --output=/scratch/alpine/pepe8426/PFC/PhyloNet/PhyloNet_h1.%j.out

#Display the job context
echo Job: $SLURM_JOB_NAME with ID $SLURM_JOB_ID
echo Running on `hostname`
echo Job started at `date +"%T %a %d %b %Y"`
echo Directory is `pwd`
echo Using $SLURM_NTASKS processors across $SLURM_NNODES nodes

#Assign path variables
DIRECTORY=/scratch/alpine/pepe8426/PFC/PhyloNet

#Load modules
module purge
module load jdk

#Enter directory
cd $DIRECTORY

#run PhyloNet

java -jar /projects/pepe8426/software/PhyloNet.jar PhyloNet_input.nex

# Final time stamp
echo Job finished at `date +"%T %a %d %b %Y"`
