#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=1-00:00:00
#SBATCH --partition=amilan
#SBATCH --ntasks=20
#SBATCH --job-name=IQTree_SuperMatrixTree
#SBATCH --mail-user=pedrohenriquepezzi@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --mem=15gb
#SBATCH --output=/scratch/alpine/pepe8426/PFC/SuperMatrix/IQTree/IQTree_SuperMatrixTree_Fabi.%j.out

#Display the job context
echo Job: $SLURM_JOB_NAME with ID $SLURM_JOB_ID
echo Running on `hostname`
echo Job started at `date +"%T %a %d %b %Y"`
echo Directory is `pwd`
echo Using $SLURM_NTASKS processors across $SLURM_NNODES nodes

#Assign path variables
DIRECTORY=/scratch/alpine/pepe8426/PFC/SuperMatrix

#Load modules
module purge

#Enter directory
cd $DIRECTORY

#run IQTree
/projects/pepe8426/software/iqtree-1.6.12-Linux/bin/iqtree \
	-s $DIRECTORY/SuperMatrix.fasta \
	-st DNA \
	-sp $DIRECTORY/IQTree/SuperMatrix_PFCOut.partitions_iqtree.txt \
	-nt 20 \
	-v \
	-bb 1000 \
	-m GTR+G

# Final time stamp
echo Job finished at `date +"%T %a %d %b %Y"`

