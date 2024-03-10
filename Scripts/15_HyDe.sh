#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=1-00:00:00
#SBATCH --partition=amilan
#SBATCH --ntasks=12       #number of cpus to use
#SBATCH --job-name=HyDe_PFC
#SBATCH --mail-user=pedrohenriquepezzi@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --mem=5gb
#SBATCH --output=/scratch/alpine/pepe8426/HyDe/HyDe.%j.out

#Display the job context
echo Job: $SLURM_JOB_NAME with ID $SLURM_JOB_ID
echo Running on `hostname`
echo Job started at `date +"%T %a %d %b %Y"`
echo Directory is `pwd`
echo Using $SLURM_NTASKS processors across $SLURM_NNODES nodes

#Assign path variables
DIRECTORY=/scratch/alpine/pepe8426/HyDe

#Load modules
module purge
module load python

#Enter directory
cd $DIRECTORY

#run HyDe

python /projects/pepe8426/software/HyDe/scripts/run_hyde_mp.py -i Input_Reorded.phy -m speciesmap.txt -o OUT -n 117 -s 5209834 -t 37 -j 12 --prefix Out_Hyde

# Final time stamp
echo Job finished at `date +"%T %a %d %b %Y"`
