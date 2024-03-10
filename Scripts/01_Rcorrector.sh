#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=1-00:00:00
#SBATCH --partition=amilan
#SBATCH --ntasks=20       #number of cpus to use
#SBATCH --job-name=RCorrector
#SBATCH --mail-user=pedrohenriquepezzi@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --mem=20gb
#SBATCH --output=/scratch/alpine/pepe8426/RawReads/Rcorrector/Petunia_rcorrector.%j.out

#Display the job context
echo Job: $SLURM_JOB_NAME with ID $SLURM_JOB_ID
echo Running on `hostname`
echo Job started at `date +"%T %a %d %b %Y"`
echo Directory is `pwd`
echo Using $SLURM_NTASKS processors across $SLURM_NNODES nodes

#Assign path variables
DIRECTORY=/scratch/alpine/pepe8426/RawReads

#Load modules
module purge
module load perl
module load anaconda
source /home/pepe8426/.bashrc
source activate rcorrector

#Run Rcorrector for all Petunia reads
cd $DIRECTORY

FILES=`ls *R1.fastq.gz | sed 's/_R1.fastq.gz//g'`
for F in $FILES
do
  R1=${F}_R1.fastq.gz
  R2=${F}_R2.fastq.gz
  run_rcorrector.pl -1 $R1 -2 $R2 -t 20 -od /scratch/alpine/pepe8426/RawReads/Rcorrector/
done

# Final time stamp
echo Job finished at `date +"%T %a %d %b %Y"`
