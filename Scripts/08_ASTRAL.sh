#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=12:00:00
#SBATCH --partition=amilan
#SBATCH --ntasks=16
#SBATCH --job-name=ASTRAL
#SBATCH --mail-user=pedrohenriquepezzi@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --mem=10gb
#SBATCH --output=/scratch/alpine/pepe8426/PFC/ASTRAL/ASTRAL.%j.out

#Display the job context
echo Job: $SLURM_JOB_NAME with ID $SLURM_JOB_ID
echo Running on `hostname`
echo Job started at `date +"%T %a %d %b %Y"`
echo Directory is `pwd`
echo Using $SLURM_NTASKS processors across $SLURM_NNODES nodes

#Assign path variables
DIRECTORY=/scratch/alpine/pepe8426/PFC/ASTRAL

#Load modules
module purge
module load jdk

#Enter directory
cd $DIRECTORY

#run ASTRAL

java -jar /projects/pepe8426/software/Astral/astral.5.7.8.jar \
	-a Astral_spmap.txt \
	-i 3672_concat_besttrees.txt \
	-o OUTPUTastral_sptree_spassigned.treefile \
	-t 1

# Final time stamp
echo Job finished at `date +"%T %a %d %b %Y"`

