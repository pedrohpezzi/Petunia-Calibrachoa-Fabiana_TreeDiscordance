#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=6:00:00
#SBATCH --partition=amilan
#SBATCH --ntasks=12
#SBATCH --job-name=CalculateLhoodPhyloNet
#SBATCH --mail-user=pedrohenriquepezzi@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --mem=50gb
#SBATCH --output=/scratch/alpine/pepe8426/PFCt/PhyloNet/CalculateLikelihood/LhoodPhyloNet_Petunia_h1.%j.out

#Display the job context
echo Job: $SLURM_JOB_NAME with ID $SLURM_JOB_ID
echo Running on `hostname`
echo Job started at `date +"%T %a %d %b %Y"`
echo Directory is `pwd`
echo Using $SLURM_NTASKS processors across $SLURM_NNODES nodes

#Assign path variables
DIRECTORY=/scratch/alpine/pepe8426/PFCt/PhyloNet/CalculateLikelihood

#Load modules
module purge
module load jdk

#Enter directory
cd $DIRECTORY

#run PhyloNet

java -jar -Xmx50g /projects/pepe8426/software/PhyloNet.jar PhyloNet_GT_NetLhood.nex

# Final time stamp
echo Job finished at `date +"%T %a %d %b %Y"`
