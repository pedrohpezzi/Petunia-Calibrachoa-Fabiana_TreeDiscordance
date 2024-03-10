#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=20:00:00
#SBATCH --partition=amilan
#SBATCH --ntasks=20
#SBATCH --job-name=Trimmomatic
#SBATCH --mail-user=pedrohenriquepezzi@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --mem=10gb
#SBATCH --output=/scratch/alpine/pepe8426/PetuniaRawReads/Trimmomatic/trimmomatic.%j.out

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
module load jdk

#Run Trimmomatic for all Fabianas
cd $DIRECTORY/Rcorrector

FILES=`ls *_R1.cor.fq.gz | sed 's/_R1.cor.fq.gz//g'`
for F in $FILES
do
  R1=${F}_R1.cor.fq.gz
  R2=${F}_R2.cor.fq.gz
  java -jar /projects/pepe8426/software/Trimmomatic-0.39/trimmomatic-0.39.jar PE \
  $DIRECTORY/Rcorrector/$R1 $DIRECTORY/Rcorrector/$R2 \
  -baseout $DIRECTORY/Trimmomatic/${F}_Trimmed.fastq.gz \
  ILLUMINACLIP:TruSeq_IDT_Illumina_trimming_seqs.fa:2:30:10:2:keepBothReads SLIDINGWINDOW:4:5 LEADING:5 TRAILING:5 MINLEN:25
done

# Final time stamp
echo Job finished at `date +"%T %a %d %b %Y"`
