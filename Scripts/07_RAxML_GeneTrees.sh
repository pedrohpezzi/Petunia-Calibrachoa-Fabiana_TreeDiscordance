#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=1-00:00:00
#SBATCH --partition=amilan
#SBATCH --ntasks=32       #number of cpus to use
#SBATCH --job-name=RAxML_GeneTrees
#SBATCH --mail-user=pedrohenriquepezzi@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --mem=2gb
#SBATCH --output=/scratch/alpine/pepe8426/PFC/GeneTrees_RAxML.%j.out

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
conda activate raxml

#Enter directory
cd $DIRECTORY

#run RAxML to get gene trees

RANDOM=$$
FILES=`ls *.fasta | sed 's/_NT_MACSE_alignment.fasta//g'`
for F in $FILES
do 
 raxmlHPC-PTHREADS-SSE3 -T 32 -s ${F}_NT_MACSE_alignment.fasta -n $F -m GTRGAMMA -# 1000 -p $RANDOM -f a -x $RANDOM ­­--print-­identical­-sequences
 mv $DIRECTORY/${F}_NT_MACSE_alignment.fasta /scratch/alpine/pepe8426/PFC/MACSE_Aligments/NT_Aligments
 mv $DIRECTORY/${F}_NT_MACSE_alignment.fasta.reduced /scratch/alpine/pepe8426/PFC/MACSE_Aligments/NT_Aligments/ReducedAligments
done

# Final time stamp
echo Job finished at `date +"%T %a %d %b %Y"`

