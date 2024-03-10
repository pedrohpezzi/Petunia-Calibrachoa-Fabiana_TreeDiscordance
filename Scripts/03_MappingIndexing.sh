#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=12:00:00
#SBATCH --partition=amilan
#SBATCH --ntasks=12
#SBATCH --job-name=Mapping_Indexing
#SBATCH --mail-user=pedrohenriquepezzi@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --mem=10gb
#SBATCH --output=/scratch/alpine/pepe8426/OutgroupRawReads/spX_rep1/spX_rep1_MappingIndexing.%j.out

#Display the job context
echo Job: $SLURM_JOB_NAME with ID $SLURM_JOB_ID
echo Running on `hostname`
echo Job started at `date +"%T %a %d %b %Y"`
echo Directory is `pwd`
echo Using $SLURM_NTASKS processors across $SLURM_NNODES nodes

#Assign path variables
DIRECTORY=/scratch/alpine/pepe8426/RawReads/spX_rep1
#### spX_rep1 indicates one species, for which the transcriptome of rep1 is already available from Wheeler et al. (2022).

#Load modules
module purge
module load anaconda
source /home/pepe8426/.bashr
conda activate samtools

#Enter directory
cd $DIRECTORY

#Index the reference fasta
bwa index INDEX/spX_rep1_transcriptome.fa
samtools faidx INDEX/spX_rep1_transcriptome.fa

echo done with indexing of reference-bwa and samtools

#Map the trimmed reads to the reference fasta of that species

FILES=`ls *_Trimmed_1P.fastq.gz | sed 's/_Trimmed_1P.fastq.gz//g'`
for F in $FILES
do
  P1=${F}_Trimmed_1P.fastq.gz
  P2=${F}_Trimmed_2P.fastq.gz
  bwa mem -t 12 INDEX/spX_rep1_transcriptome.fa $P1 $P2 | samtools sort > ${F}.sorted.bam
  echo done with mapping of sample $F
  samtools flagstat ${F}.sorted.bam > Stats_${F}_bam.out
  echo done with bam stats of $F
  samtools index ${F}.sorted.bam
  echo done with indexing of ${F}
done

# Final time stamp
echo Job finished at `date +"%T %a %d %b %Y"`
