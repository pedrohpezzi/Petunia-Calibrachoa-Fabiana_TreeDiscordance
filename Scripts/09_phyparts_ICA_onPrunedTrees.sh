#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=3-00:00:00
#SBATCH --qos=long
#SBATCH --partition=amilan
#SBATCH --ntasks=8       #number of cpus to use
#SBATCH --job-name=phyparts_ICA_PFC_Pruned
#SBATCH --mail-user=pedrohenriquepezzi@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --mem=100gb
#SBATCH --output=/scratch/alpine/pepe8426/PFC/NT_Aligments/phyparts/phyparts_ICA_PFC_Pruned.%j.out

#Display the job context
echo Job: $SLURM_JOB_NAME with ID $SLURM_JOB_ID
echo Running on `hostname`
echo Job started at `date +"%T %a %d %b %Y"`
echo Directory is `pwd`
echo Using $SLURM_NTASKS processors across $SLURM_NNODES nodes

#Assign path variables
DIRECTORY=/scratch/alpine/pepe8426/DataSet_woCEXC/NT_Aligments/phyparts

#Load modules
module purge
module load jdk
module load anaconda
source /home/pepe8426/.bashrc
conda activate phyparts


#Enter directory
cd $DIRECTORY

#run ICA in phyparts

java -jar -Xmx1100g /projects/pepe8426/software/phyparts/target/phyparts-0.0.1-SNAPSHOT-jar-with-dependencies.jar -a 1 -v -d $DIRECTORY/PrunedTrees \
	-m $DIRECTORY/RootedAndPruned_BOER_tree.treefile -s 0.5 -o phyparts_PCFout_Pruned

# Final time stamp
echo Job finished at `date +"%T %a %d %b %Y"`
