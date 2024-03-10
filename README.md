# Tree discordance and hybridization in *Petunia* and related genera
Scripts and data associated with the publication on tree discordance and hybridization in the *Petunia*-*Calibrachoa*-*Fabiana* clade are available. Some data files are too large to be uploaded to Github; therefore, please refer to [FigShare](https://figshare.com/s/c3f6e7305660e03031ec) to download them. The raw transcriptome data were obtained from Wheeler et al. [(2022)](https://doi.org/10.1093/molbev/msac044) and [(2023)](https://doi.org/10.1098/rspb.2023.0275) and are deposited at SRA under [BioProject PRJNA746328](https://www.ncbi.nlm.nih.gov/bioproject/?term=PRJNA746328).

## Transcriptomic data filtering and processing
[**1.**](Scripts/01_Rcorrector.sh) Correct reads with Rcorrector

[**2.**](Scripts/02Trimmomatic.sh) Remove adaptors with Trimmomatic

[**3.**](Scripts/MappingIndexing.sh) Map and index reads with bwa and samtools

[**4.**](Scripts/04_Consensus_MostFrequentBase.sh) Call the most frequent base to get the consensus fasta

## Phylogenomic analyses and tree discordance evaluation


## Hybridization analyses


## Network reconstruction


