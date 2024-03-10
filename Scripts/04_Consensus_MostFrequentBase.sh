#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=12:00:00
#SBATCH --partition=amilan
#SBATCH --ntasks=1
#SBATCH --job-name=GetSamToolsConsensus
#SBATCH --mail-user=pedrohenriquepezzi@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --mem=10gb
#SBATCH --output=/scratch/alpine/pepe8426/RawReads/SamtoolsConsensus.%j.out

#Display the job context
echo Job: $SLURM_JOB_NAME with ID $SLURM_JOB_ID
echo Running on `hostname`
echo Job started at `date +"%T %a %d %b %Y"`
echo Directory is `pwd`
echo Using $SLURM_NTASKS processors across $SLURM_NNODES nodes

#Assign path variables
DIRECTORY=/scratch/alpine/pepe8426/RawReads/BamFiles

#Load modules
module purge
export LD_LIBRARY_PATH=/curc/sw/install/bio/htslib/1.16/install/lib

#Enter directory
cd $DIRECTORY

FILES=`ls *.sorted.bam | sed 's/.sorted.bam//g'`
for F in $FILES
do
 /curc/sw/install/bio/samtools/1.16/install/bin/samtools consensus -f fasta -o ${F}_consensus.fasta -a -m simple -c 0.1 ${F}.sorted.bam
 echo done with sample $F
done

# Final time stamp
echo Job finished at `date +"%T %a %d %b %Y"`
