# Tree discordance and hybridization in *Petunia* and related genera
Scripts and data associated with the publication on tree discordance and hybridization in the *Petunia*-*Calibrachoa*-*Fabiana* clade are available. Some data files are too large to be uploaded to Github; therefore, please refer to [FigShare](https://figshare.com/s/c3f6e7305660e03031ec) to download them. The raw transcriptome data were obtained from Wheeler et al. [(2022)](https://doi.org/10.1093/molbev/msac044) and [(2023)](https://doi.org/10.1098/rspb.2023.0275) and are deposited at SRA under [BioProject PRJNA746328](https://www.ncbi.nlm.nih.gov/bioproject/?term=PRJNA746328).

## Transcriptomic data filtering and processing
[**1.**](Scripts/01_Rcorrector.sh) Correct reads with Rcorrector.

[**2.**](Scripts/02Trimmomatic.sh) Remove adapters with Trimmomatic.

[**3.**](Scripts/MappingIndexing.sh) Map and index reads with BWA and SAMtools.

[**4.**](Scripts/04_Consensus_MostFrequentBase.sh) Call the most frequent base to obtain the consensus FASTA.

[**5.**](Scripts/05_ConcatenateFastaByCluster.sh) Combine the FASTA files from multiple individuals into a single FASTA file representing the genomic region/cluster/gene.

## Phylogenomic analyses and tree discordance evaluation

[**6.**](Scripts/06_Align_MACSE.sh) Align the FASTA files with MACSE.

[**7.**](Scripts/07_RAxML_GeneTrees.sh) Obtain gene trees with RAxML.

[**8.**](Scripts/08_ASTRAL.sh) Estimate species tree with [ASTRAL](Data/ASTRAL).

[**9.**](Scripts/09_QuartetsSampling.sh) Assess ASTRAL tree discordance with [Quartet Sampling](Data/QuartetSampling).

[**10.**](Scripts/10_phyparts_ICA_onPrunedTrees.sh) Assess IQTree tree discordance with [phyparts](Data/phyparts).

[**11.**](Scripts/11_IQTree.sh) Estimate species tree with [IQTree](Data/IQTree).

[**12**](Scripts/12_IQTree_ConcordanceFactor.sh) Assess IQTree tree discordance with [ConcordanceFactors](Data/IQTree/IQTree_ConcordanceFactors.919641.out)

[**13**](Scripts/13_SVDQuartets.sh) Estimate species tree with [SVDQuartets](Data/SVDQuartets)

## Hybridization analyses
[**14**](Scripts/14_TrimAligmentsForHyDe.sh) Trim alignments to assess hybridization with HyDe.

[**15**](Scripts/15_HyDe.sh) Detect hybridization with [HyDe](Data/HyDe).

[**16**](Scripts/16_QuiBL.sh) Detect hybridization with [QuiBL](Data/QuiBL).

[**17**](Scripts/17_TWISST.py) Calculate topology weight with [Twisst](Data/TWISST).

## Network reconstruction

[**18**](Scripts/18_SNaQ.sh) Infer phylogenetic network with [SNaQ](Data/SNaQ).

[**19**](Scripts/19_PhyloNet.sh) Infer phylogenetic network with [PhyloNet](Data/PhyloNet).

[**20**](Scripts/20_CalculateLhoodPhyloNet.sh) Calculate the [likelihood](Data/PhyloNet/Likelihood) of the PhyloNet networks.

