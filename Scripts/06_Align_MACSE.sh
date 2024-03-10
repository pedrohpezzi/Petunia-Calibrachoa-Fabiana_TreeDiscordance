#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=1-00:00:00
#SBATCH --partition=amilan
#SBATCH --ntasks=12      #number of cpus to use
#SBATCH --job-name=Align_MACSE
#SBATCH --mail-user=pedrohenriquepezzi@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --mem=5gb
#SBATCH --output=/scratch/alpine/pepe8426/FastaFiles/Align_with_MACSE.%j.out

#Display the job context
echo Job: $SLURM_JOB_NAME with ID $SLURM_JOB_ID
echo Running on `hostname`
echo Job started at `date +"%T %a %d %b %Y"`
echo Directory is `pwd`
echo Using $SLURM_NTASKS processors across $SLURM_NNODES nodes

#Assign path variables
DIRECTORY=/scratch/alpine/pepe8426/FastaFiles/

#Load modules
module purge
module load jdk

#Align all sequences with MAFFT
cd $DIRECTORY

FILES=`ls *.fasta | sed 's/.fasta//g'`
for F in $FILES
do
  FASTA=${F}.fasta
  java -jar -Xmx4g /projects/pepe8426/software/macse_v2.06.jar -prog alignSequences -seq $FASTA -out_NT ${F}_NT_MACSE_alignment.fasta -out_AA ${F}_AA_MACSE_alignment.fasta
  mv *_MACSE_alignment.fasta /scratch/alpine/pepe8426/FastaFiles/MACSE_Aligments
  mv $FASTA $DIRECTORY/DoneSequences
 echo done with $F
done

# Final time stamp
echo Job finished at `date +"%T %a %d %b %Y"`
