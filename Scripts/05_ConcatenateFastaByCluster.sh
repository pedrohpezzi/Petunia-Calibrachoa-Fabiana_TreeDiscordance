#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=6:00:00
#SBATCH --partition=amilan
#SBATCH --ntasks=12       #number of cpus to use
#SBATCH --job-name=ConcatenateFastaByCluster
#SBATCH --mail-user=pedrohenriquepezzi@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --mem=5gb
#SBATCH --output=/scratch/alpine/pepe8426/ConcatenateFastaByCluster.%j.out

#Display the job context
echo Job: $SLURM_JOB_NAME with ID $SLURM_JOB_ID
echo Running on `hostname`
echo Job started at `date +"%T %a %d %b %Y"`
echo Directory is `pwd`
echo Using $SLURM_NTASKS processors across $SLURM_NNODES nodes

#Assign path variables
DIRECTORY=/scratch/alpine/pepe8426/ConsensusSequences

#Load modules
module purge

#Enter directory
cd $DIRECTORY
echo Directory is `pwd`

#get names

while read Cluster
do
 echo $Cluster
 cat */*${Cluster}.fa > /scratch/alpine/pepe8426/NotAlignedData/${Cluster}_not_aligned.fasta
done < ../AllClustersConsensus.txt

# Final time stamp
echo Job finished at `date +"%T %a %d %b %Y"`
