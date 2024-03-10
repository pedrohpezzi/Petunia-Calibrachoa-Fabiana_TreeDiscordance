#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=1-00:00:00
#SBATCH --partition=amilan
#SBATCH --ntasks=30
#SBATCH --job-name=QuartetSampling_PFC
#SBATCH --mail-user=pedrohenriquepezzi@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --mem=10gb
#SBATCH --output=/scratch/alpine/pepe8426/PFC/NT_Aligments/QuartetSampling/QuartetSampling_PFC.%j.out

#Display the job context
echo Job: $SLURM_JOB_NAME with ID $SLURM_JOB_ID
echo Running on `hostname`
echo Job started at `date +"%T %a %d %b %Y"`
echo Directory is `pwd`
echo Using $SLURM_NTASKS processors across $SLURM_NNODES nodes

#Assign path variables
DIRECTORY=/scratch/alpine/pepe8426/PFC/NT_Aligments/QuartetSampling

#Load modules
module purge
module load python
module load anaconda
source /home/pepe8426/.bashrc
conda activate QS

#Enter directory
cd $DIRECTORY

#run quartet sampling

python quartetsampling/pysrc/quartet_sampling.py --tree OUTPUTastral_sptree.treefile --align SuperMatrix_PFCOut_nospaces.phy --reps 100 \
	 --threads 30 --lnlike 2 --ignore-error --genetrees SuperMatrix_PFCOut_partitions_QS.txt --verbose

# Final time stamp
echo Job finished at `date +"%T %a %d %b %Y"`
