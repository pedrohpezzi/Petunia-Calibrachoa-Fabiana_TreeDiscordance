#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=1-00:00:00
#SBATCH --partition=amilan
#SBATCH --ntasks=24
#SBATCH --job-name=QuIBL
#SBATCH --mail-user=pedrohenriquepezzi@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --mem=15gb
#SBATCH --output=/scratch/alpine/pepe8426/DataSetNoMissingLoci/QuIBL/QuIBL.%j.out

#Display the job context
echo Job: $SLURM_JOB_NAME with ID $SLURM_JOB_ID
echo Running on `hostname`
echo Job started at `date +"%T %a %d %b %Y"`
echo Directory is `pwd`
echo Using $SLURM_NTASKS processors across $SLURM_NNODES nodes

#Assign path variables
DIRECTORY=/scratch/alpine/pepe8426/DataSetNoMissingLoci/QuIBL

#Load modules
module purge
module load anaconda
source /home/pepe8426/.bashrc
conda activate quibl

#Enter directory
cd $DIRECTORY

#run QuIBL

python /projects/pepe8426/software/QuIBL/QuIBL.py InputFile.txt

# Final time stamp
echo Job finished at `date +"%T %a %d %b %Y"`
