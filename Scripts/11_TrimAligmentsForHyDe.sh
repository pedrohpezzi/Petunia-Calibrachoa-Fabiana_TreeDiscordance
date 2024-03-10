#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=1:00:00
#SBATCH --partition=amilan
#SBATCH --ntasks=4       #number of cpus to use
#SBATCH --job-name=TrimAligments
#SBATCH --mail-user=pedrohenriquepezzi@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --mem=500MB
#SBATCH --output=/scratch/alpine/pepe8426/PFC/TrimAligments.%j.out

#Display the job context
echo Job: $SLURM_JOB_NAME with ID $SLURM_JOB_ID
echo Running on `hostname`
echo Job started at `date +"%T %a %d %b %Y"`
echo Directory is `pwd`
echo Using $SLURM_NTASKS processors across $SLURM_NNODES nodes

#Assign path variables
DIRECTORY=/scratch/alpine/pepe8426/PFC/MACSE_Aligments/NT_Aligments

#Load modules
module purge
module load anaconda
source /home/pepe8426/.bashrc
conda activate trimal

#Enter directory
cd $DIRECTORY

#trim sites with more than 50% of missing data

FILES=`ls $DIRECTORY | sed 's/_NT_MACSE_alignment.fasta//g'`
for F in $FILES
do 
 trimal -in ${F}_NT_MACSE_alignment.fasta -out /scratch/alpine/pepe8426/PFC/TrimmedAligments/${F}_trimmed.fasta -gt 0.5 -cons 60 
done

# Final time stamp
echo Job finished at `date +"%T %a %d %b %Y"`

