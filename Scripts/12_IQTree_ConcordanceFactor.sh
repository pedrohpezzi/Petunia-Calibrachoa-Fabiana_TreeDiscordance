#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=1-00:00:00
#SBATCH --partition=amilan
#SBATCH --ntasks=32 
#SBATCH --job-name=IQTree_CF
#SBATCH --mail-user=pedrohenriquepezzi@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --mem=50gb
#SBATCH --output=/scratch/alpine/pepe8426/PFC/NT_Aligments/SuperMatrix/IQTree/IQTree_ConcordanceFactors.%j.out

#Display the job context
echo Job: $SLURM_JOB_NAME with ID $SLURM_JOB_ID
echo Running on `hostname`
echo Job started at `date +"%T %a %d %b %Y"`
echo Directory is `pwd`
echo Using $SLURM_NTASKS processors across $SLURM_NNODES nodes

#Assign path variables
DIRECTORY=/scratch/alpine/pepe8426/PFC/NT_Aligments/SuperMatrix

#Load modules
module purge

#Enter directory
cd $DIRECTORY

#run IQTree
/projects/pepe8426/software/iqtree-2.2.0-Linux/bin/iqtree2 \
	-t $DIRECTORY/IQTree/SuperMatrix_PFCOut.partitions_iqtree.txt.treefile \
	--gcf $DIRECTORY/PFC_loci.treefile \
	-s $DIRECTORY/SuperMatrix_PFCOut.fasta \
	--scf 100 \
	--prefix PFC_Concord

# Final time stamp
echo Job finished at `date +"%T %a %d %b %Y"`

